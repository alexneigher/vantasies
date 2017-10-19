class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)

    unless @message.save
      render :error and return
    end

    MessageMailer.message_email(@message.id).deliver_now
  end

  private
    def message_params
      params.require(:message).permit(:reply_to_email, :name, :body, :van_id)
    end

end