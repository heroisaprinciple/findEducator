class PersonalMessagesController < ApplicationController
  before_action :mentor_or_user_access

  def index
    @messages = collection

    render json: @messages
  end

  def create
    @message = collection.new(message_params)

    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message = collection.last
    @message.destroy
  end

  private

  def set_conversation
    Conversation.find(params[:conversation_id])
  end

  def collection
    set_conversation.personal_messages
  end

  def message_params
    params.require(:personal_message).permit(:content, :sent_at, :user_id, :mentor_id)
  end
end