class Order < ApplicationRecord
  belongs_to :User
  belongs to :Product
end
