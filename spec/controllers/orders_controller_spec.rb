require 'rails_helper'
RSpec.describe OrdersController, type: :controller do

  context 'POST #create' do

    before do
      @user = User.create(email: 'test@example.com')
      @product = Product.create(name: 'Test Product', price: 50, stock_quantity: 10)
      @order_item_params = { product_id: @product.id, quantity: 2 }
      @order_params = { order_items_attributes: [@order_item_params] }
    end

    context 'when product availability validation succeeds' do
      before do
        allow_any_instance_of(OrderHelper).to receive(:validate_product_availability).and_return({ product: @product, error: nil, status: nil })
      end
      it 'returns http success' do
        post :create, params: { user_id: @user.id, order: @order_params }
        expect(response.status).to eq(200)
      end
    end

    context 'when product availability validation fails' do
      before do
        allow_any_instance_of(OrderHelper).to receive(:validate_product_availability).and_return({ error: 'Product not available', status: 422 })
      end
      it 'returns a validation error' do
        post :create, params: { user_id: @user.id, order: @order_params }
        expect(response).to have_http_status(422)
      end
    end

  end

end