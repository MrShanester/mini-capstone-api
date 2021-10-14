class ProductsController < ApplicationController
  def display_all
    content = Product.all
    render json: content
  end

  def url_display
    input = params["wildcard"].to_i
    output = Product.find_by id: input
    render json: output.to_json
  end

  def display 
    input = params["id"].to_i
    output = Product.find_by id: input
    render json: output.to_json
  end
end
