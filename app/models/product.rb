class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  scope :in_stock, -> { where('stock_quantity > 0') }
end