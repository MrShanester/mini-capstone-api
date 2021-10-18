class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image_url, :description, :friendly_created_at, :is_discounted?, :tax, :total
end
