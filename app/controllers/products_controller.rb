class ProductsController < ApplicationController

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :image))
 
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
