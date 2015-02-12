class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @location = Location.find(params[:location_id])
    @event.location_id = params[:location_id]
    @event.save
    redirect_to location_path(@location), :notice => 'Event was successfully created.'
  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def update
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to location_path(@location), :notice => 'Event was successfully updated.'
  end

  def destroy
    @location = Location.find(params[:location_id])
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to location_path(@location), :notice => 'Event was successfully destroyed.'
  end

  def event_params
    params.require(:event).permit(:description, :date, :requires_id, :location_id)
  end

end
