class ConversationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :mentor_or_user_access, only: [:index, :destroy]

  def index
    if current_mentor
      @conversations = current_mentor.conversations
    elsif current_user
      @conversations = current_user.conversations
    end

    render json: @conversations
  end

  def create
    unless current_user
      forbidden_message
      return
    end

    if Conversation.between(conversation_params[:user_id], conversation_params[:mentor_id]).present?
      @conversation = Conversation.between(conversation_params[:user_id], conversation_params[:mentor_id]).first
    else
      @conversation = current_user.conversations.create!(conversation_params)
    end

    render json: @conversation
  end

  def destroy
    Conversation.find(params[:id]).destroy
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user_id, :mentor_id)
  end
end