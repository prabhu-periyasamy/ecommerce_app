class OrderItemBlueprint < Blueprinter::Base
  view :normal do
    fields :unit_price, :quantity
    association :product, blueprint: ProductBlueprint
  end
end