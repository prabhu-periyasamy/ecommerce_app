class OrdersController < ApplicationController

  # To skip CSRF token validation
  skip_before_action :verify_authenticity_token

  def index
    @orders = Order.all
    render json: OrderBlueprint.render(@orders, view: :normal)
  end

  def new
    # TODO : find whats the usage of this method
  end

  def create
    @order = Order.new(product_params)
    @order.save
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  def show
    @order = Order.find(params[:id])
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  def edit
    # TODO : find whats the usage of this method
  end

  def update
    @order = Order.find(params[:id])
    @order.update(product_params)
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id)
  end
end