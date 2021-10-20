class ProductsController < ApplicationController
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true

  def index
    output = Product.all
    render json: output
  end

  def show
    input = params["id"].to_i
    output = Product.find_by id: input
    render json: output
  end

  def create
    product = Product.new(name: params["name"], price: params["price"], image_url: params["image_url"], description: params["description"])
    product.save
    render json: product
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
    product.save
    render json: product
  end
end
