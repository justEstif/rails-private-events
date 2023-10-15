class EventsController < ApplicationController
  def index
    @events = Event.order(date: :desc)
  end
end
