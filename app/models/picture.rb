class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  # serialize the data before saving to DB
  serialize :tags, Array
end
