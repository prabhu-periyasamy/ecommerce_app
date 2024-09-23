module Api
  class CategoriesController < ApplicationController

    # To skip CSRF token validation
    skip_before_action :verify_authenticity_token

    #  filters
    before_action :require_login, except: [:index]
    around_action :exceeds_limit
    def index
      @categories = Category.all
      render json: CategoryBlueprint.render(@categories)
    end

    def new
      # TODO : find whats the usage of this method
    end

    def create
      @category = Category.new(category_params)
      @category.save
      render json: CategoryBlueprint.render(@category)
    end

    def show
      @category = Category.find(params[:id])
      render json: CategoryBlueprint.render(@category)
    end
    def edit
      # TODO : find whats the usage of this method
    end
    def update
      @category = Category.find(params[:id])
      @category.update(category_params)
      render json: CategoryBlueprint.render(@category)
    end
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      render json: CategoryBlueprint.render(@category)
    end

    private
    def category_params
      params.require(:category)
            .permit(:name, :description,
                    :products_attributes => [:name, :price, :description, :stock_quantity])
    end

    def require_login
      puts "**********USER LOGGED IN************"
    end


    def exceeds_limit
      if params[:id].to_i < 100
        yield
      else
        raise ActiveRecord::Rollback
      end
    end

  end
end