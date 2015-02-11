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




scenario 'User can create an event at a location' do

@location = Location.create(:name => "galva", :address => "2015 haight", :zipcode => 1221)
@event = Event.create(description: "Event1", date: "1/23/15", requires_id: "true", location_id: 22 )

visit "/locations/#{@location.id}/"

click_on ("New Event")

visit "/locations/#{@location.id}/events/new"

fill_in 'event[description]', :with => "Great event"
fill_in 'event[date]', with: "1/23/15"
check 'event[requires_id]', "checked"

click_on ("Create Event")

visit "/locations/#{@location.id}"

expect(page).to have_content("Great event")

end

end
