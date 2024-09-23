class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :unit_price

      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
