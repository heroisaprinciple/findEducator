class Api::V1::SubjectsController < ApplicationController
  before_action :admin_access, only: [:create, :update, :destroy]

  def index
    @subjects = collection

    render json: @subjects
  end

  def show
    @subject = resource

    render json: @subject
  end

  def create
    @subject = collection.build(subject_params)

    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def update
    @subject = resource

    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @subject = resource

    @subject.destroy
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def collection
    @category = set_category
    @category.subjects
  end

  def resource
    collection.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
