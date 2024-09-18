class ProductBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description, :price, :stock_quantity, :category_id
end