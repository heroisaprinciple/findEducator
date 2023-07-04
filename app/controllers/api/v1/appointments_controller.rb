class AppointmentBuilder
  attr_accessor :appointment

  def self.build
    builder = new
    yield(builder)
    builder.appointment
  end

  def initialize
    @appointment = Appointment.new
  end

  def set_status
    @appointment.status = Appointment.statuses[:booked]
  end

  def set_start_time(params)
    @appointment.start_time = params
  end

  def set_end_time(params)
    @appointment.end_time = DateTime.parse(set_start_time(params)) + 60.minutes
  end

  def set_meeting_link
    @appointment.meeting_link = "/#{SecureRandom.urlsafe_base64}"
  end

  def set_description(params)
    @appointment.description = params
  end

  def set_mentor(mentor)
    @appointment.mentor_id = mentor.id
  end

  def set_conversation(conversation)
    @appointment.conversation_id = conversation.id
  end

  def set_user(user)
    @appointment.user_id = user
  end
end

class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show]
  def index
    if current_user
      @appointments = current_user.appointments
    elsif current_mentor
      @appointments = current_mentor.appointments
    end

    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def create
    unless current_mentor
      forbidden_message
      return
    end

    conversation = Conversation.find(appointment_params[:conversation_id])
    user = conversation.user_id

    @appointment = AppointmentBuilder.build do |builder|
      builder.set_status
      builder.set_start_time(appointment_params[:start_time])
      builder.set_end_time(appointment_params[:start_time])
      builder.set_meeting_link
      builder.set_description(appointment_params[:description])
      builder.set_mentor(current_mentor)
      builder.set_conversation(conversation)
      builder.set_user(user)
    end

    if @appointment.save
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:start_time, :description, :conversation_id)
  end
end

