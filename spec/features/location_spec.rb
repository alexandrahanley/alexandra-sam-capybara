require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Galvanize"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content("Galvanize")
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")
  end

  scenario 'User can view a show page for a location' do

    @location = Location.create(:name => "g6", :address => "2062 delaware", :zipcode => 122121)

    visit "/locations/#{@location.id}"
    expect(page).to have_content("g6")
  end

  scenario 'User can edit a location' do
    @location = Location.create(:name => "galva", :address => "2015 haight", :zipcode => 1221)


    visit "/locations/#{@location.id}/edit"

    fill_in 'location[name]', :with => "New Random Location"
    fill_in 'location[address]', with: "Addressssss"
    fill_in 'location[zipcode]', with: 5005

    click_on("Update Location")

    expect(page).to have_content("New Random Location")
    expect(page).to have_content("Addressssss")
    expect(page).to have_content(5005)

 end

  scenario 'User can delete a location' do
    @location = Location.create(:name => "galva")

    visit "/locations"

    expect(page).to have_content("galva")

    click_on("Delete")

    expect(page).to have_content("Location was successfully destroyed.")
  end






end
