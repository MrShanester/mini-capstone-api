class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      status: "Carted",
      order_id: nil
    )
    if carted_product.save
      render json: carted_product.as_json
    else 
      render json: {error: carted_product.errors.full_messages}, status: 406
    end
  end

  def index
    carted_product = CartedProduct.where(user_id: current_user.id)
    render json: carted_product.as_json
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params["id"])
    carted_product.status = "Removed"
    carted_product.product_id = carted_product.product_id
    carted_product.quantity =  carted_product.quantity
    carted_product.order_id = carted_product.order_id
    carted_product.user_id = carted_product.user_id
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {error: carted_product.errors.full_messages}
    end
  end
end
