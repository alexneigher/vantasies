class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)

    unless @message.save
      render :error and return
    end

    #TODO actually send the email
  end

  private
    def message_params
      params.require(:message).permit(:reply_to_email, :name, :body, :van_id)
    end

end