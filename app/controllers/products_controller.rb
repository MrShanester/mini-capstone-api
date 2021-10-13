class ProductsController < ApplicationController
  def display_all
    content = Product.all
    render json: content
  end

  def display_product
    render :json (message: "Which product would you like to see today? (Enter a Product ID Number)")
    product = gets.chomp.to_i
    content = Product.find_by(id:product)
    render json: content
  end
end
