class MessageMailer < ApplicationMailer

  def message_email(message_id)
    @message = Message.find(message_id)
    @van = @message.van

    @van_owner = @van.user
    binding.pry
    mail(to: @van_owner.email, reply_to: @message.reply_to_email,  subject: 'Someone wants to buy your van!')
  end
  #Send by doing: > MessageMailer.message_email(Message.first.id).deliver
end
