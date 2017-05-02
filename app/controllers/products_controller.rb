class ProductsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_admin_user?, only: :mark_as_pro
  before_filter :is_owner_user?, only: [:create, :new]

  def new
  end

  def show
    @product = Product.find(params[:id])
    @role = session[:role]
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :image))
    @product.shop = @current_user.shop
 
    @product.save
    redirect_to @product
  end

  def index
    @role = session[:role]
    if @role == 'guest'
      @products = Product.where('is_pro = ?', true)
    else
      @products = Product.all
    end
  end

  def mark_as_pro
    @product = Product.find_by(id: params[:id])
    @product.is_pro = true
    @product.save
    redirect_to products_path
  end

  def update
  end

  private

  def is_admin_user?
    if session[:role] != 'admin'
      redirect_to products_path, alert: 'Not authorized for edit product'
    end
  end

  def is_owner_user?
    if session[:role] != 'owner'
      redirect_to products_path, alert: 'Not authorized for create product'
    end
  end

end
