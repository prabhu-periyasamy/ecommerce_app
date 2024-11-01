class ProductsController < ApplicationController

  # To skip CSRF token validation
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
    render json: ProductBlueprint.render(@products, view: :general_view)
  end

  def new
    # TODO : find whats the usage of this method
  end

  def create
    @product = Product.new(product_params)
    @product.save
    render json: ProductBlueprint.render(@product, view: :general_view)
  end

  def show
    @product = Product.find(params[:id])
    render json: ProductBlueprint.render(@product, view: :general_view)
  end

  def edit
    # TODO : find whats the usage of this method
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    render json: ProductBlueprint.render(@product, view: :general_view)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: ProductBlueprint.render(@product, view: :general_view)
  end

  def offer_price
    @product = Product.find(params[:id])
    render json: {"offer_price": @product.price / 50, view: :general_view}
  end

  def groceries
    render json: {"groceries": "yet to be added"}
  end

  def available
    @products = Product.in_stock
    render json: ProductBlueprint.render(@products, view: :general_view)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id)
  end
end