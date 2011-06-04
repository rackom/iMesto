class Event < ActiveRecord::Base
  validates_presence_of :name, :description, :address
end
