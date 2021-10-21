class SuppliersController < ApplicationController
  def create
    supplier = Supplier.new(name: params["name"], email: params["email"], phone_number: params["phone_number"])
    if supplier.save
      render json: supplier.as_json
    else 
      render json: {error: supplier.errors.full_messages}, status: 406
    end
  end

  def update
    input = params["id"]
    supplier = Supplier.find_by id: input
    supplier.name = params["name"] || supplier.name
    supplier.email = params["email"] || supplier.email
    supplier.phone_number = params["phone_number"] || supplier.phone_number
    if supplier.save
      render json: supplier.as_json
    else 
      render json: {error: supplier.errors.full_messages}, status: 406
    end
  end

  def destroy
    input = params["id"].to_i
    supplier = Supplier.find_by id: input
    supplier.destroy
    render json: {message: "Supplier Annihilated"}
  end
end
