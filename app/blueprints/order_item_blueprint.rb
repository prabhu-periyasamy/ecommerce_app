class OrderItemBlueprint < Blueprinter::Base
  view :normal do
    fields :unit_price, :quantity
    association :order, blueprint: OrderBlueprint, view: :normal
    association :product, blueprint: ProductBlueprint
  end
end