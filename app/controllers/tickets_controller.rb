class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    # BUG: unknown attribute 'user_id' for Ticket.
    @ticket = current_user.tickets.build(event: @event)

    if @ticket.save
      # Ticket purchase was successful
    else
      # Handle validation errors or other issues
    end
  end
end
