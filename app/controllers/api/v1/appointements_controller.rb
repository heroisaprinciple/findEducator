class AppointementBuilder
  attr_reader :appointement

  def self.build
    builder = new
    yield(builder)
    builder.appointement
  end

  def initialize
    @appointement = Appointement.new
  end

  def set_status
    @appointement.status = Appointement.statuses[:booked]
  end

  def set_start_time
    @appointement.start_time = DateTime.current
  end

  def set_end_time
    @appointement.end_time = DateTime.current + 60.minutes
  end

  def set_meeting_link
    @appointement.meeting_link = "/#{SecureRandom.urlsafe_base64}"
  end

  def set_description(params)
    @appointement.description = params
  end

  def set_user(user)
    @appointement.user_id = user.id
  end

  def set_mentor(mentor)
    @appointement.mentor_id = mentor.id
  end

  # def set_payment(user)
  #    @appointement.payment_id = user.payments.last.id
  # end
end

class Api::V1::AppointementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointement, only: %i[show update destroy]
  def index
    binding.pry
    @appointements = current_user.appointements

    render json: @appointements
  end

  def show
    @appointement = current_user.appointements.find(params[:id])

    render json: @appointement
  end
  def create_checkout_session
    Stripe.api_key = ENV['STRIPE_API_KEY']
    def checkout(current_user, success_url, cancel_url)
      current_user.set_payment_processor :stripe
      current_user.payment_processor.customer

      checkout_session = current_user.payment_processor.checkout(
        [{
          price_data: {
            currency: "eur",
            product_data: {
              name: @subject.name,
              metadata: {
                id: @subject.id
              },
            },
            unit_amount_decimal: @mentor.prices.find_by(subject_id: @subject.id).amount,
          },
          quantity: 1,
        }],
          line_items: line_items,
          mode: 'payment',
          success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
          cancel_url: cancel_url
        )

      redirect_to checkout_session.url, allow_other_host: true, status: 303
    end

    def session(session_id)
      Stripe::Checkout::Session.retrieve(session_id)
    end
  end

  def success
    Stripe.api_key = ENV['STRIPE_API_KEY']
    payment_session = payment.session(session[:checkout_session_id])

    if payment_session.payment_status == 'paid'
      payment = create_payment(total_amount)
      create_appointenment(payment)
      # clear_cart

      redirect_to edit_api_v1_user_appointement_path(id: @appointement.id)
    end
  end

  def create_payment(total_amount)
    @payment = Payment.create(
      sum: total_amount,
      status: Payment.statuses[:paid],
      paid_at: DateTime.current,
      payment_method: 'card',
      user_id: current_user.id,
      mentor_id: current_user.mentors.last.id
    )
  end

  def create
    @appointement = AppointementBuilder.build do |builder|
      builder.set_status
      builder.set_start_time
      builder.set_end_time
      builder.set_meeting_link
      builder.set_description(appointment_params[:description])
      builder.set_user(current_user)
      builder.set_mentor(current_user.mentors.last)
      builder.set_payment(current_user)
    end

    if @appointement.save
      render json: @appointement
    else
      render json: @appointement.errors, status: :unprocessable_entity
    end
  end

  private

  def set_appointement
    @appointement = Appointement.find(params[:id])
  end

  def appointment_params
    params.require(:appointement).permit(:start_time, :end_time, :meeting_link, :status, :description,
                                         :mentor_id, :user_id, :payment_id)
  end
end

