class Product < ApplicationRecord
  has_many :images
  has_many :order_items
  has_many :reviews
end
