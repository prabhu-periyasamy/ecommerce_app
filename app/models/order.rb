class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  # :through is used for tables which has many to many mappings
  # A order can have many products (through order_items) <==> A product can belongs to multiple orders (through order_items)
  # Here the connecting table is (order_items)
  # sample query:
  # order.order_items
  #   SELECT `order_items`.* FROM `order_items` WHERE `order_items`.`order_id` = 1
  # order.products
  #   SELECT `products`.* FROM `products` INNER JOIN `order_items`
  #   ON `products`.`id` = `order_items`.`product_id`
  #   WHERE `order_items`.`order_id` = 1
  has_many :products, through: :order_items
  accepts_nested_attributes_for :order_items
  include LogConcern

  # This method will be called whenever the class is loaded in memory, in other way (when the class is called or accessed for the first time)
  log_name
end