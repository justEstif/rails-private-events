class Ticket < ApplicationRecord
  belongs_to :attendee
  belongs_to :event
end
