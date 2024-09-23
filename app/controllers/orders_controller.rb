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
    @order = Order.new(order_params)
    @order.user_id = params[:user_id]
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
    @order.update(order_params)
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render json: OrderBlueprint.render(@order, view: :normal)
  end

  def get_user
    @order = Order.find(params[:id])
    render json: UserBlueprint.render(@order.user, view: :normal)
  end

  private
  def order_params
    params.require(:order).permit(:order_date, :status, :total_amount)
  end
end