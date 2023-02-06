class Api::V1::ProductsController < Api::ApplicationController
private
  def product_params
    params.require(:product).permit(:name, :description, videos: [])
  end
end
