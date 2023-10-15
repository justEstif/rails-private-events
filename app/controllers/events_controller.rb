class EventsController < ApplicationController
  include EventsHelper
  def index
    @events = Event.order(date: :asc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event '#{@event.name}' created!"
      redirect_to @event
    else
      flash[:alert] = "Some error!"
      render "new"
    end
  end
end
