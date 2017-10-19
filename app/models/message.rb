class Message < ApplicationRecord
  belongs_to :van

  validates_presence_of :name, :reply_to_email
end
