class CategoryBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description
  association :products, blueprint: ProductBlueprint, name: :items
end