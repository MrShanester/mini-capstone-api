class OrdersController < ApplicationController
  def index
    order = current_user.orders.all
    if current_user
      render json: order
    else
      render json: {message: "User not logged in."}
    end
  end

  def show
    if current_user
      order = current_user.orders.find_by(id: params[:id]) 
      render json: order
    else
      render json: {message: "Unauthorized"}, status: 401
    end
  end

  def create
    if current_user
      product = Product.find_by(id: params["product_id"])
      quantity = params["quantity"]
      order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: product.price * quantity,
        tax: product.tax * quantity,
        total: product.total * quantity
      )
      if order.save 
        render json: order
      else 
        render json: {error: order.errors.full_messages}, status: 406
      end
    else
      render json: {message: "Unauthorized"}, status: 401
    end
  end

  def update
    if current_user
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
    else
      render json: {message: "Unauthorized"}, status: 401
    end
  end

  def destroy
    if current_user
      input = params["id"]
      order = Order.find_by id: input
      order.destroy
      render json: {message: "Order Destroyed."}
    else
      render json: {message: "Unauthorized"}, status: 401
    end
  end
end
