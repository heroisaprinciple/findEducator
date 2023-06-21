class Api::V1::SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show update destroy]
  before_action :access, only: %i[create update destroy]

  def index
    @subjects = Subject.where(category_id: params[:category_id])

    render json: @subjects
  end

  def show
    render json: @subject
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.category_id = params[:category_id]
    if @subject.save
      render json: @subject, status: :created
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
