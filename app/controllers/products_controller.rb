class ProductsController < ApplicationController
  def display_all
    content = Product.all
    render json: content
  end

  def display_product1
    content = Product.first
    render json: content
  end

  def display_product2
    content = Product.second
    render json: content
  end

  def display_product3
    content = Product.last
    render json: content
  end
end
