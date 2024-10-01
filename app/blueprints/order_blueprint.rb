class OrderBlueprint < Blueprinter::Base
  view :normal do
    fields :order_date, :status, :total_amount
    association :order_items, blueprint: OrderItemBlueprint, view: :normal
  end
end