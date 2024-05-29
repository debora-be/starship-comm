class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def import
    file = params[:file]
    ImportProducts.call(file)
    head :ok
  end
end
