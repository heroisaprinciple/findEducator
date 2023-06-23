class Api::V1::PersonalMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_mentor!
  before_action :current_user

  def index
    @messages = current_user.personal_messages

    render json: @messages
  end

  def show
    @message = current_user.personal_messages.find(params[:id])

    render json: @message
  end

  def create
    if current_user
      @message = current_user.personal_messages.new(message_params)
      @message.user_id = current_user.id
    elsif current_mentor
      @message = current_mentor.personal_messages.new(message_params)
      @message.mentor_id = current_mentor.id
    end

    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sent_at, :user_id, :mentor_id)
  end
end