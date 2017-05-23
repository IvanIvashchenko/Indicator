class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user?, only: :mark_as_pro
  before_filter :owner_user?, only: [:create, :new]

  def new
  end

  def show
    @product = Product.find(params[:id])
    @role = session[:role]
    @show_buy_button = @role == 'guest' && !@product.is_pro && @product.shop
  end

  def create
    @product = Product.new(
      params.require(:product).permit(:title, :description, :image)
    )
    @product.shop = @current_user.shop
    @product.save
    redirect_to @product
  end

  def index
    @role = session[:role]
    @products = Product.all
  end

  # TODO: move to separate controller
  def mark_as_pro
    @product = Product.find_by(id: params[:id])
    @product.is_pro = true
    @product.save
    redirect_to products_path
  end

  # TODO: move to separate controller
  def buy_product
    email = @current_user.email
    domain_zone = email.split('.').last
    if domain_zone == 'com'
      response = { error: 'You could not buy products cause your domain zone is ".com"' }
      render json: response
      return
    end

    image_id = rand(1..5000)
    response = HTTP.get(
      "http://jsonplaceholder.typicode.com/photos/#{image_id}"
    ).to_s
    response_object = JSON.parse(response)
    url_value = response_object['url'].split('/')[-1]
    thumbnail_url_value = response_object['thumbnailUrl'].split('/')[-1]
    if thumbnail_url_value > url_value
      # TODO: send mail to admins with user emails
      # TODO: show error message to user
    else
      id_response = JSON.parse(
        HTTP.post('http://jsonplaceholder.typicode.com/todos').to_s
      )
      id = id_response['id']
      puts id
      # TODO: send id to admins
      # TODO: send thumbnail to user
    end
    puts response
    render json: response
  end

  private

  def admin_user?
    return if session[:role] == 'admin'
    redirect_to products_path, alert: 'Not authorized for edit product'
  end

  def owner_user?
    return if session[:role] == 'owner'
    redirect_to products_path, alert: 'Not authorized for create product'
  end
end
