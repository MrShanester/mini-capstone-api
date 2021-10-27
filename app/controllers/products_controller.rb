class ProductsController < ApplicationController
  before_action :authenticate_user


  def index
    product = Product.all
    if params[:category]
      cat = Category.find_by(name: params[:category])
      product = cat.products
    end
    render json: product
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
