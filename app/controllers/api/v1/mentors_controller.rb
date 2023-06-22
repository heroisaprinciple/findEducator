class Api::V1::MentorsController < ApplicationController
  before_action :set_mentor

  def index
    @mentors = Mentor.all

    render json: @mentors
  end

  def show
    render json: @mentor
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end
end
