class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin, except: [:index, :show]

  def index
    order = current_user.orders.all
    render json: order
  end

  def show
    order = current_user.orders.find_by(id: params[:id]) 
    render json: order
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if order.save 
      render json: order
    else 
      render json: {error: order.errors.full_messages}, status: 406
    end
  end

  def update
    input = params["id"]
    order = Order.find_by id: input
    order.user_id = params["user_id"] || order.user_id
    order.product_id = params["product_id"] || order.product_id
    order.quantity = params["quantity"] || order.quantity
    order.subtotal = params["subtotal"] || order.subtotal
    order.tax = params["tax"] || order.tax
    order.total = params["total"] || order.total
    if order.save 
      render json: order
    else 
      render json: {error: order.errors.full_messages}, status: 406
    end
  end

  def destroy
    input = params["id"]
    order = Order.find_by id: input
    order.destroy
    render json: {message: "Order Destroyed."}
  end
end
