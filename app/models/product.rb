class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  # polymorphic association
  has_one :picture, as: :imageable

  scope :in_stock, -> { where('stock_quantity > 0') }
end