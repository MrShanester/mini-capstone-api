class ProductsController < ApplicationController

  def index
    output = Product.all
    if current_user
      render json: output
    else
      render json: {message: "User not logged in."}
    end
  end

  def show
    input = params["id"].to_i
    output = Product.find_by id: input
    render json: output
  end

  def create
    product = Product.new(name: params["name"], price: params["price"], image_url: params["image_url"], description: params["description"])
    if product.save
      render json: product
    else 
      render json: {error: product.errors.full_messages}, status: 406
    end
  end

  def destroy
    input = params["id"].to_i
    product = Product.find_by id: input
    product.destroy
    render json: {message: "Product Annihilated"}
  end

  def update
    input = params["id"]
    product = Product.find_by id: input
    product.name = params["name"] || product.name
    product.price = params["price"] || product.price
    product.image_url = params["image_url"] || product.image_url
    product.description = params["description"] || product.description
    if product.save
      render json: product
    else 
      render json: {error: product.errors.full_messages}, status: 406
    end
  end
end
