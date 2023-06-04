class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /subjects
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /subjects/1
  def show
    render json: @categories
  end

  # POST /subjects
  def create
    @category = Category.find_by(name: category_params[:name])

    if @category.nil?
      @category = Category.new(category_params)
      if @category.save
        render json: @category, status: :created
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Category with the same name already exists' }, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /subjects/1
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @category.destroy
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end