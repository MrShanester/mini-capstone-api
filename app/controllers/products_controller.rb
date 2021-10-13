class ProductsController < ApplicationController
  def display_all
    content = Products.all
    render json: content.json
  end
end
