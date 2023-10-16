class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    if @event.attendees.include?(current_user)
      flash[:error] = "You are already attending this event."
      redirect_to root_path
    else
      @ticket = Ticket.new
    end
  end

  def create
    @event = Event.find(params[:event_id])

    if current_user == @event.creator
      flash[:error] = "You cannot purchase a ticket for your own event."
      redirect_to root_path
    else
      @ticket = current_user.tickets.build(event: @event)

      if @ticket.save
        flash[:success] = "Ticket purchase was successful."
        redirect_to root_path
      else
        flash[:error] = "Error purchasing the ticket."
        render "new"
      end
    end
  end
end
