class OrderBlueprint < Blueprinter::Base
  view :normal do
    fields :order_date, :status, :total_amount
    association :user, blueprint: UserBlueprint
  end
end