class Api::V1::PersonalMessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = PersonalMessage.all

    render json: @messages
  end

  def create
    @mentor = Mentor.find(params[:mentor_id])
    @message = PersonalMessage.new(message_params)
    @message.user = current_user.id
    @messages.mentor = @mentor.id

    if @message.save
      redirect_to api_v1_user_personal_messages_path(user_id: current_user.id), notice: 'Message sent successfully.'
    else
      flash[:error] = 'Failed to send the message.'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sent_at)
  end
end