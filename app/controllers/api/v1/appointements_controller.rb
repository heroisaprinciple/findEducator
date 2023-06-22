class AppointementBuilder
  attr_reader :appointement

  def self.build
    builder = new
    yield(builder)
    builder.new
  end

  def initialize
    @appointement = Appointement.new
  end

  def set_status
    @appointement.status = Appointement.statuses[:booked]
  end

  def set_start_time
    @appointement.start_at = DateTime.current
  end

  def set_end_time
    @appointement.end_time = DateTime.current + 60
  end

  def set_meeting_link
    # Generate an 8-character random string
    # "/api/v1/users/#{user_id}/appointments/#{random_string}"
    @appointement.meeting_link = api_v1_user_appointement + SecureRandom.urlsafe_base64
  end

  def set_description
    @appointement.description
  end

  def set_user(user)
    @order.user = user
  end

  def set_mentor(mentor)
    @appointement.mentor = mentor
  end

  def set_payment(payment)
    @order.payment = payment
  end
end

class Api::V1::AppointementsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!
  before_action :set_appointement
  def index
    @appointements = Appointement.all

    render json: @appointements
  end

  def show
    @appointement = Appointement.find(params[:id])

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

  def create_appointement(payment)
    @appointement = AppointementBuilder.build do |builder|
      builder.set_status
      builder.set_meeting_link
      builder.set_start_time
      builder.set_end_time
      builder.set_user(current_user)
      builder.set_mentor(current_user.mentors.last)
      builder.set_payment(payment)
    end

    # id: 1,
    #   start_time: Wed, 07 Jun 2023 10:58:38.901839000 UTC +00:00,
    #   end_time: Wed, 07 Jun 2023 11:58:38.901852000 UTC +00:00,
    #   meeting_link: "/4343k2gksagakgsaas",
    #   status: "pending",
    #   description: "Noooo, I wanna sleep",
    #   mentor_id: 1,
    #   user_id: 26,
    #   payment_id: 1,
    #   created_at: Wed, 07 Jun 2023 10:58:38.905083000 UTC +00:00,
    #   updated_at: Wed, 07 Jun 2023 10:58:38.905083000 UTC +00:00>

      @appointement.save
  end

  private

  def set_appointement
    @appointement = Appointement.find(params[:id])
  end
end

