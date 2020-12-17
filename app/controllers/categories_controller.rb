class CategoriesController < ApplicationController
  before_action :user_from_token, only: %i[index create]
  # GET /categories
  def index
    user = check_authorization
    if user.nil?
      render response: 'Not authorized', status: 403
    else
      categories = Category.all
      render json: categories
    end
  end

  # POST /categories
  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created, location: category
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def user_from_token
    @user = check_authorization
  end

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.require(:category).permit(:name, :logourl)
  end
end
