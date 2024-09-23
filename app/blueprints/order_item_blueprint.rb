class OrderItemBlueprint < Blueprinter::Base
  view :normal do
    fields :unit_price, :quantity
    association :product, blueprint: ProductBlueprint, view: :order_items_view
  end
end