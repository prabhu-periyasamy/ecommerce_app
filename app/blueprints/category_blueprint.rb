class CategoryBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description
  # category has many products
  association :products, blueprint: ProductBlueprint
end