class Message < ActiveRecord::Base
  validates_presence_of :message, :url
end
