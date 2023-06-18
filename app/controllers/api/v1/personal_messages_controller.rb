class Api::V1::PersonalMessagesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @messages = PersonalMessage.all

    render json: @messages
  end

  def create
    @mentor = Mentor.find(params[:mentor_id])
    @message = @mentor.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to mentor_messages_path(@mentor), notice: 'Message sent successfully.'
    else
      flash[:error] = 'Failed to send the message.'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end