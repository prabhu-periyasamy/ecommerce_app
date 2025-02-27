class OrdersController < ApplicationController
  include OrderHelper

  # To skip CSRF token validation
  skip_before_action :verify_authenticity_token

  # set user in before action
  before_action :set_user, only: [:create]

  def index
    @orders = Order.all
    # root is used to define the root key in the json response
    # render - will give response as serialized json
    # render_as_hash - will give response as hash which is used to manipulate the response before rendering
    render json: OrderBlueprint.render(@orders, view: :normal, root: :orders)
  end

  def new
    # TODO : find whats the usage of this method
  end

  def create
    @order = @user.orders.build(order_params)

    total_amount = 0

    @order.order_items.each do |order_item|
      validate_product = validate_product_availability(order_item)

      if validate_product[:error]
        render json: { error: validate_product[:error] }, status: validate_product[:status]
        return
      end

      @product = validate_product[:product]

      # Set the unit price for the order item
      order_item.unit_price = @product.price

      # reduce stock quantity from the product
      @product.stock_quantity -= order_item.quantity

      # save the updated product
      @product.save

      # calculate total amount for the order
      total_amount += @product.price * order_item.quantity
    end

    # set other fields
    @order.status = "draft"
    @order.order_date = Time.now
    @order.total_amount = total_amount
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
  def set_user
    @user = User.find(params[:user_id])
  end

  def order_params
    params.require(:order).permit(:order_items_attributes => [:product_id, :quantity])
  end
end