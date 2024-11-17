# sample.rb
class ProductChecker
  def check_status(product)
    if product.nil?
      "No product"
    elsif product == 0
      "Out of stock"
    else
      "In stock"
    end
  end
end

