class Message < ActiveRecord::Base
  validates_presence_of :message_text, :message_url
end
