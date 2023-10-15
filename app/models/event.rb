class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :tickets
  has_many :attendees, through: :tickets, source: :attendee
end
