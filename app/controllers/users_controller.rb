class UsersController < ApplicationController
  def show
    @events = current_user.created_events
    @attended_events = current_user.attended_events
  end
end
