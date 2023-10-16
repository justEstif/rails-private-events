class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date >= ?", Time.now) }

  belongs_to :creator, class_name: "User"
  has_many :tickets
  has_many :attendees, through: :tickets, source: :attendee
end
