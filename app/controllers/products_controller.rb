class ProductsController < ApplicationController

  before_filter :authenticate_user!

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
  end

  def show
    @product = Product.find(params[:id])
  end
end
