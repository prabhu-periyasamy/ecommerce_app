class User < ApplicationRecord
  has_many :orders
  has_one :imageable, polymorphic: true
end