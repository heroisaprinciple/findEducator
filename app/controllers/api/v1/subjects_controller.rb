class Api::V1::SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show update destroy ]

  # GET /subjects
  def index
    @subjects = Subject.where(category_id: params[:category_id])

    render json: @subjects
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    @subject = Subject.find_by(name: subject_params[:name])

    if @subject.nil?
      @subject = Subject.new(subject_params)
      if @subject.save
        render json: @subject, status: :created
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Subject with the same name already exists' }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :category_id)
  end
end


# def create_checkout_session
#   if user_signed_in? && current_user
#     Stripe.api_key = ENV['STRIPE_API_KEY']
#     current_user.set_payment_processor :stripe
#     current_user.payment_processor.customer
#
#     line_items = @cart_products.map do |item|
#       {
#         price_data: {
#           currency: "eur",
#           product_data: {
#             name: @subject.name,
#             description: @subject.description,
#             metadata: {
#               id: @subject.id
#             },
#           },
#           unit_amount: @mentor.prices.find_by(subject_id: @subject.id).amount,
#         },
#         quantity: 1,
#       }
#     end
#
#     current_user.payment_processor.checkout(
#       line_items: line_items,
#       mode: 'payment',
#       success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
#       cancel_url: cancel_url
#     )
#
#     redirect_to checkout_session.url, status: 303
#   end
# end