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
    return if domain_zone_com?(email)

    image_id = rand(1..5000)
    response = HTTP.get(
      "http://jsonplaceholder.typicode.com/photos/#{image_id}"
    ).to_s
    response_object = JSON.parse(response)
    return unless successful_purchase?(response_object, email)
    id_response = JSON.parse(
      HTTP.post('http://jsonplaceholder.typicode.com/todos').to_s
    )
    id = id_response['id']
    # TODO: use sidekiq
    GuestMailer.purchase_email(@current_user, response_object['thumbnailUrl']).deliver_later
    AdminMailer.success_purchase_email(id).deliver_later
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

  def domain_zone_com?(email)
    domain_zone = email.split('.').last
    return false unless domain_zone == 'com'
    response = {
      error: 'You could not buy products cause your domain zone is ".com"'
    }
    render json: response
    true
  end

  def successful_purchase?(response_object, email)
    url_value = response_object['url'].split('/').last
    thumbnail_url_value = response_object['thumbnailUrl'].split('/').last
    return true if thumbnail_url_value <= url_value
    AdminMailer.error_purchase_email(email).deliver_later
    response = {
      error: 'Sorry, but your purchase is unsuccessful. Try again later'
    }
    render json: response
    false
  end
end
