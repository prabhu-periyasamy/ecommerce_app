class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, comment: "user table to store users" do |t|
      t.date :order_date
      t.string :status
      t.decimal :total_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
