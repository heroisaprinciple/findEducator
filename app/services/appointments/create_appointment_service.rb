# PORO to create an appointment
class Appointments::CreateAppointmentService
  attr_reader :start_time, :end_time, :description, :mentor, :user, :payment

  def initialize(start_time, description, mentor, user, payment)
    @start_time = start_time
    @description = description
    @mentor = mentor
    @user = user
    @payment = payment
  end

  def create_appointment
    Appointment.new(start_time: @start_time,
                    description: @description,
                    mentor_id: @mentor,
                    status: set_status,
                    end_time: set_end_time(@start_time),
                    meeting_link: set_meeting_link,
                    user_id: @user,
                    payment_id: @payment
    )
  end

  def call
    create_appointment
  end

  private

  def set_status
    Appointment.statuses[:booked]
  end

  def set_end_time(time)
    DateTime.parse(time) + 60.minutes
  end

  def set_meeting_link
    "/#{SecureRandom.urlsafe_base64}"
  end
end

