class Api::V1::CategoriesController < ApplicationController
  before_action :admin_access, only: [:create, :update, :destroy]

  def index
    @categories = collection

    render json: @categories
  end

  def show
    @category = resource

    render json: @category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    @category = resource

    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category = resource

    @category.destroy
  end

  private

  def collection
    Category.all
  end

  def resource
    collection.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end