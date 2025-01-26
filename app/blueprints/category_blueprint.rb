class CategoryBlueprint < Blueprinter::Base
  transform Transformers::AddCurrentDateTransformer
  identifier :id
  fields :name, :description
  # category has many products
  association :products, blueprint: ProductBlueprint, view: :general_view
end