class Event < ActiveRecord::Base
  validates_presence_of :title, :message, :address
end