class OrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal, :total, :tax

  belongs_to :product
end
