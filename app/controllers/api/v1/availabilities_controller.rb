class Api::V1::AvailabilitiesController < ApplicationController
  before_action :authenticate_mentor!

  def index
    @availabilities = collection

    render json: @availabilities
  end

  def create
    @availability = collection.new(availabilities_params)
    @availability.end_time = DateTime.parse(availabilities_params[:start_time]) + 60.minutes
    @availability.status = Availability.statuses[:free]

    if @availability.save
      render json: @availability
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  def update
    @availability = resource

    if @availability.update(availabilities_params)
      # TODO: think about a functionality if a mentor does not want to change a status, but everything else
      @availability.status = Availability.statuses[:booked]
      render json: @availability
    else
      render json: @availability.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @availability = resource

    @availability.destroy
  end

  private

  def collection
    current_mentor.availabilities
  end

  def resource
    collection.find(params[:id])
  end

  def availabilities_params
    params.require(:availability).permit(:year, :month, :day, :start_time)
  end
end