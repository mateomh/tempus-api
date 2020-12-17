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
      user = user.as_json[0]
      token = JWT.encode(
        user,
        Rails.application.secrets.secret_key_base,
        'HS256'
      )

      render json: {
        id: user['id'],
        name: user['name'],
        avatarurl: user['avatarurl'],
        created_at: user['created_at'],
        updated_at: user['updated_at'],
        token: token
      }
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
