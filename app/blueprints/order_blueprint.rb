class OrderBlueprint < Blueprinter::Base
  # Global level added transformers are not working need to check
  # transform Transformers::AddCurrentDateTransformer
  view :normal do
    transform Transformers::AddCurrentDateTransformer
    fields :order_date, :status, :total_amount
    association :order_items, blueprint: OrderItemBlueprint, view: :normal
  end
end