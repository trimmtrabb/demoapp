class Api::V1::ProductsController < Api::ApplicationController
  def create
    @product = Product.new(product_params)
    # binding.break
    if @product.save
      render json: @product, status: :created #, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, videos: [])
  end
end
