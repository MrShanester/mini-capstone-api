class OrdersController < ApplicationController
  def index
    output = Order.all 
    render json: output.as_json
  end

  def show
    input = params["id"]
    order = Order.find_by id: input
    render json: order.as_json
  end

  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: Product.find_by(id: params["product_id"]).price * params["quantity"],
      tax: Product.find_by(id: params["product_id"]).tax * params["quantity"],
      total: Product.find_by(id: params["product_id"]).total * params["quantity"]
    )
    if order.save 
      render json: order.as_json
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
      render json: order.as_json
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
