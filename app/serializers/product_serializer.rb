class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price,:description, :friendly_created_at, :is_discounted?, :tax, :total, :inventory

  belongs_to :supplier
  has_many :images
  has_many :categories
end
