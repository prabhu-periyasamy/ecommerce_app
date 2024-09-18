class ProductBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description, :price, :stock_quantity, :category_id
  field :full_name do |product|
    "DMART - #{product.name}"
  end
end