class UsersController < ApplicationController

  # To skip CSRF token validation
  before_action :set_user, only: [:show, :edit, :update, :destroy, :upload_picture]
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
    # render json: UserBlueprint.render(@users, view: :normal)
  end

  def show
    # render json: UserBlueprint.render(@user, view: :normal)
  end

  def create
    @user = User.new(user_params)
    @user.save
    render json: UserBlueprint.render(@user, view: :normal)
  end

  def update
    @user.update(user_params)
    render json: UserBlueprint.render(@user, view: :normal)
  end

  def destroy
    @user.destroy
    render json: UserBlueprint.render(@user, view: :normal)
  end

  def upload_picture
    picture = Picture.new(name: "#{@user.name}_pic", imageable: @user)
    picture.save
    render json: { picture: picture }
  end

  def new
    @user = User.new
  end

  private
  # rails uses strong parameters to filter the data passed as mass attributes before saving data using model methods
  def user_params
    params.require(:user).permit(:name, :email, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end