# Private Events

Private Events: A site similar to a private Eventbrite which allows users to
create events and then manage user signups.

A user can create events. A user can attend many events. An event can be
attended by many users. Events take place at a specific date and at a location
(which you can just store as a string, like “Andy’s House”).

## Tables

- User (create and attend many events)
- Event (date and location, users)
- UserEvent(host, attendant)

```ruby
class Event
  has_many :attendants
  has_many :attendees, through: :attendants, source: :attendee
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
end

class Attendant
  belongs_to :event
  belongs_to :attendee, class_name: "User"
end

class User
  has_many :attendants
  has_many :events, through: :attendants
  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
end
```
