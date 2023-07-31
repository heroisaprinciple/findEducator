class RatingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @ratings = collection

    render json: @ratings
  end

  def create
    @rating = collection.build(rating_params)
    @rating.user = current_user

    if @rating.save
      render json: @rating
    else
      render json: { error: 'Unfortunately, your review can not be created' }, status: :unprocessable_entity
    end
  end

  private

  def set_mentor
    Mentor.find(params[:mentor_id])
  end

  def collection
    set_mentor.ratings
  end

  def rating_params
    params.require(:rating).permit(:rating, :review)
  end
end
