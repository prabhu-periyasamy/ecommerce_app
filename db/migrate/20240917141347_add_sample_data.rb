class AddSampleData < ActiveRecord::Migration[6.1]
  def up
    # Adding sample users
    User.create!([
                   { name: "Alice", email: "alice@example.com", address: "456 Elm Street" },
                   { name: "Bob", email: "bob@example.com", address: "789 Maple Avenue" }
                 ])

    # Adding sample categories
    Category.create!([
                       { name: "Electronics", description: "Devices and gadgets" },
                       { name: "Books", description: "Fiction and non-fiction" }
                     ])

    # Adding sample products
    Product.create!([
                      { name: "Laptop", description: "A high-performance laptop", price: 999.99, stock_quantity: 10, category_id: Category.find_by(name: "Electronics").id },
                      { name: "Novel", description: "An engaging novel", price: 19.99, stock_quantity: 20, category_id: Category.find_by(name: "Books").id }
                    ])

    # Adding sample orders
    Order.create!([
                    { user_id: User.find_by(name: "Alice").id, order_date: Date.today, status: "Pending", total_amount: 999.99 },
                    { user_id: User.find_by(name: "Bob").id, order_date: Date.today, status: "Completed", total_amount: 19.99 }
                  ])

    # Adding sample order items
    OrderItem.create!([
                        { order_id: Order.find_by(user_id: User.find_by(name: "Alice").id).id, product_id: Product.find_by(name: "Laptop").id, quantity: 1, unit_price: 999.99 },
                        { order_id: Order.find_by(user_id: User.find_by(name: "Bob").id).id, product_id: Product.find_by(name: "Novel").id, quantity: 1, unit_price: 19.99 }
                      ])
  end

  def down
    # Removing all sample data
    OrderItem.destroy_all
    Order.destroy_all
    Product.destroy_all
    Category.destroy_all
    User.destroy_all
  end
end
