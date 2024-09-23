class OrderItemsController < ApplicationController

  # To skip CSRF token validation
  skip_before_action :verify_authenticity_token

  def index
    @order_items = OrderItem.all
    render json: OrderItemBlueprint.render(@order_items, view: :normal)
  end

  def create
    @order_item = OrderItem.new(order_params)
    @order_item.save
    render json: OrderItemBlueprint.render(@order_item, view: :normal)
  end

  def show
    @order_item = OrderItem.find(params[:id])
    render json: OrderItemBlueprint.render(@order_item, view: :normal)
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_params)
    render json: OrderItemBlueprint.render(@order_item, view: :normal)
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    render json: OrderItemBlueprint.render(@order_item, view: :normal)
  end

  private
  def order_params
    params.require(:Order).permit(:name, :description, :price, :stock_quantity, :category_id)
  end
end