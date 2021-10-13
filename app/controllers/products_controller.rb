class ProductsController < ApplicationController
  def display_all
    content = Product.all
    render json: content
  end
end
