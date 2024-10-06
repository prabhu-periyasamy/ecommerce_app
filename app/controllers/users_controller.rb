class UsersController < ApplicationController

  # To skip CSRF token validation
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    # render json: UserBlueprint.render(@users, view: :normal)
  end

  def show
    @user = User.find(params[:id])
    # render json: UserBlueprint.render(@user, view: :normal)
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: UserBlueprint.render(@user, view: :normal)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: UserBlueprint.render(@user, view: :normal)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: UserBlueprint.render(@user, view: :normal)
  end

  private
  # rails uses strong parameters to filter the data passed as mass attributes before saving data using model methods
  def user_params
    params.require(:user).permit(:name, :email, :address)
  end
  
end