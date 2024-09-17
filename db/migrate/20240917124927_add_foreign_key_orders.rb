class AddForeignKeyOrders < ActiveRecord::Migration[6.1]
  def change
    change_table :orders do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
