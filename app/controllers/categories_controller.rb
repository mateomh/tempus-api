class CategoriesController < ApplicationController
  # GET /categories
  def index
    categories = Category.all

    render json: categories
  end

  # GET /categories/1
  def show
    category = Category.find(params[:id])
    render json: category
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

  # Only allow a trusted parameter "white list" through.
  def category_params
    params.require(:category).permit(:name, :logourl)
  end
end
