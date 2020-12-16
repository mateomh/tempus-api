class UsersController < ApplicationController
  # GET /users
  def index
    users = User.all

    render json: users
  end

  # GET /users/1
  def show
    user = User.where(name: params[:id])
    
    if user.empty?
      render response: 'User not found', status: 404
    else
      render json: user
    end
    
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :avatarurl)
  end
end
