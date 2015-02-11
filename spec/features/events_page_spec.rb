# Users can visit a show page for an event.
# Users can create an event at an event.
# Users can see a show page for an event.
# Users can edit an event.
# Users can delete an event.

require 'rails_helper'

describe 'User can CRUD events' do

scenario 'User can view a show page for an event' do
  @location = Location.create(:name => "g6", :address => "2062 delaware", :zipcode => 122121)
  @event = Event.create(description: "Event1", date: "1/23/15", requires_id: "true", location_id: 22 )

  visit "locations/#{@location.id}/events/#{@event.id}"
  expect(page).to have_content("Event1")
end





end
