class Api::V1::AppointmentsController < ApplicationController
  before_action :resource, only: [:show]
  def index
    if current_user
      @appointments = current_user.appointments
    elsif current_mentor
      @appointments = current_mentor.appointments
    end

    render json: @appointments
  end

  def show
    @appointment = resource

    render json: @appointment
  end

  def create
    unless current_mentor
      forbidden_message
      return
    end

    begin
      ActiveRecord::Base.transaction do
        @appointment = Appointments::CreateAppointmentService.new(appointment_params[:start_time],
                                                                  appointment_params[:description],
                                                                  appointment_params[:mentor_id],
                                                                  appointment_params[:user_id],
                                                                  appointment_params[:payment_id]).call

        if @appointment.save
          render json: @appointment
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def resource
    Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :description, :user_id, :mentor_id, :payment_id)
  end
end

