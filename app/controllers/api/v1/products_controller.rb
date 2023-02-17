class Api::V1::ProductsController < Api::ApplicationController
  def new # for browser only
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :video)
  end
end
