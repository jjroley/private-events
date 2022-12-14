class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
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
      @event.attendees << current_user
      redirect_to @event, notice: 'Event successfully created'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy()
    redirect_to root_path, notice: "Event deleted"
  end

  def attend
    @event = Event.find(params[:id])

    if @event.attendees.include?(current_user)
      @event.attendees.delete(current_user)
      redirect_to @event, notice: "You've just left this event"
    else
      @event.attendees << current_user
      redirect_to @event, notice: "You've subscribed to this event"
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :location, :date)
  end
end
