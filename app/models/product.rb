class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true
  
  def is_discounted?
    price < 10
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    total = tax + price
    return total
  end

  def friendly_created_at
    friend = created_at.strftime("%A, %d %b %Y %l:%M %p")
    return friend
  end
end
