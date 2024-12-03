class User < ApplicationRecord
  has_many :orders
  has_one :picture, as: :imageable
end