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

  def create
    product = Product.new(name: params["name"], price: params["price"], image_url: params["image_url"], description: params["description"])
    product.save
    render json: product.as_json
  end

  def destroy
    input = params["id"].to_i
    product = Product.find_by id: input
    product.destroy
  end

  def update
    input = params["id"]
    product = Product.find_by id: input
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    product.save
    render json: product.as_json
  end
end
