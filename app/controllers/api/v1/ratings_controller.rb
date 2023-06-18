class Api::V1::RatingsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @ratings = Rating.all
    render json: @ratings
  end

  def new
    @rating = Rating.new
  end

  def create
    @mentor = Mentor.find(params[:mentor_id])
    @rating = @mentor.ratings.build(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to api_v1_ratings_path, notice: 'Review created successfully.'
    else
      render json: { error: 'Unfortunately, your review can not be created' }, status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :review)
  end
end
