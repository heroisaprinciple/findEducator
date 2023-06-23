class Api::V1::RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @ratings = Rating.where(mentor_id: params[:mentor_id])

    render json: @ratings
  end

  def create
    @mentor = Mentor.find(params[:mentor_id])
    @rating = @mentor.ratings.build(rating_params)
    @rating.user = current_user

    if @rating.save
      render json: @rating
    else
      render json: { error: 'Unfortunately, your review can not be created' }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :review)
  end
end
