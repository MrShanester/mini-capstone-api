class ProductsController < ApplicationController
  def index
    content = Product.all
    render json: content.as_json
  end

  def show
    input = params["id"].to_i
    output = Product.find_by id: input
    render json: output.as_json
  end
end
