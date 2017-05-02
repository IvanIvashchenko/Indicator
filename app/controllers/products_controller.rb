class ProductsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_admin_user?, only: :mark_as_pro

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :image))
    @product.shop = @current_user.shop
 
    @product.save
    redirect_to @product
  end

  def index
    @products = Product.all
    @role = session[:role]
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
      puts 'ololo'
      redirect_to products_path, alert: 'Not authorized for edit product'
    end
  end

end
