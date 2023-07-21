class MentorsController < ApplicationController
  def index
    @mentors = collection

    render json: @mentors
  end

  def show
    @mentor = resource

    render json: @mentor
  end

  def destroy
    @mentor = resource

    @mentor.destroy
  end

  private

  def collection
    Mentor.all
  end

  def resource
    collection.find(params[:id])
  end
end
