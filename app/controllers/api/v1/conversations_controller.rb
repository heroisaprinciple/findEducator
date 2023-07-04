class Api::V1::ConversationsController < ApplicationController
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
    if current_user.id != conversation_params[:user_id]
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
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user_id, :mentor_id)
  end
end