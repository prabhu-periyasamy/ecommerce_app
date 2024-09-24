require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the OrderHelper. For example:
#
# describe OrderHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe OrderHelper, type: :helper do
  describe '#validate_product_availability' do
    let(:order_item) { double('OrderItem', product_id: product_id, quantity: quantity) }
    let(:product_id) { 1 }
    let(:quantity) { 5 }

    context 'when product is not found' do
      before do
        allow(Product).to receive(:find).with(product_id).and_return(nil)
      end

      it 'returns a not found error' do
        result = helper.validate_product_availability(order_item)
        expect(result[:error]).to eq("Product with ID #{product_id} not found")
        expect(result[:status]).to eq(:not_found)
      end
    end

    context 'when product is found but insufficient stock' do
      let(:product) { double('Product', id: product_id, stock_quantity: 3) }

      before do
        allow(Product).to receive(:find).with(product_id).and_return(product)
      end

      it 'returns an insufficient stock error' do
        result = helper.validate_product_availability(order_item)
        expect(result[:error]).to eq("Insufficient stock for Product ID #{product.id}. Available: #{product.stock_quantity}, Requested: #{order_item.quantity}")
        expect(result[:status]).to eq(:unprocessable_entity)
      end
    end

    context 'when product is found and sufficient stock' do
      let(:product) { double('Product', id: product_id, stock_quantity: 10) }

      before do
        allow(Product).to receive(:find).with(product_id).and_return(product)
      end

      it 'returns the product' do
        result = helper.validate_product_availability(order_item)
        expect(result[:product]).to eq(product)
      end
    end
  end
end

