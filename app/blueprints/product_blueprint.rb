class ProductBlueprint < Blueprinter::Base
  view :general_view do
    transform Transformers::AddCurrentDateTransformer
    identifier :id
    fields :name, :description, :price, :stock_quantity, :category_id
    # custom field
    field :full_name do |product|
      "DMART - #{product.name}"
    end
  end

  view :order_items_view do
    transform Transformers::AddCurrentDateTransformer
    identifier :id
    fields :name, :description, :price
  end
end