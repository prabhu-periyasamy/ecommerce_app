class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  accepts_nested_attributes_for :order_items
  include LogConcern
end