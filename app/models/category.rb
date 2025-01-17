class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :products

  include LogConcern

  # model methods
  def print
    puts "Id: #{self.id}"
    puts "Name: #{self.name}"
    puts "Description: #{self.description}"
  end
end