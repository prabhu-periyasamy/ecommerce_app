module OrderHelper
  def validate_product_availability(order_item)
    product = Product.find(order_item.product_id)

    # check if product_ids mentioned in the order_items are available - Else throw exception
    if product.nil?
      return { error: "Product with ID #{order_item.product_id} not found", status: :not_found }
    end

    # check if quantity mentioned in the order_items are available in stock - Else throw exception
    if order_item.quantity > product.stock_quantity
      return { error: "Insufficient stock for Product ID #{product.id}. Available: #{product.stock_quantity}, Requested: #{order_item.quantity}", status: :unprocessable_entity }
    end

    { product: product }
  end
end
