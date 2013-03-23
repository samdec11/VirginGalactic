require 'spec_helper'

describe 'Flights' do
  describe 'GET /flights' do
    it 'has a New Flight button', :js => true do
      login_admin
      page.should have_link('New Flight')
    end
  end
  describe 'GET /flights/new' do
    it 'shows the form when the New Flight link is clicked', :js => true do
      login_admin
      click_link('New Flight')
      page.should have_link('Cancel')
      page.should have_button('Create Flight')
    end
    it 'clears the form when the cancel button is clicked', :js => true do
      login_admin
      click_link('New Flight')
      click_link('Cancel')
      page.should_not have_link('Cancel')
      page.should_not have_button('Create Flight')
    end
  end
  describe 'POST /flights' do
    it 'creates a new flight from the form', :js => true do
      plane = FactoryGirl.create(:plane)
      login_admin
      click_link('New Flight')
      fill_in('Name', :with => '1234')
      fill_in('Date', :with => '2013-04-20')
      fill_in('Origin', :with => 'JFK')
      fill_in('flight_dest', :with => 'LAX')
      select(plane.name, :from => 'plane_select')
      click_button('Create Flight')
      page.should_not have_link('Cancel')
      page.should_not have_button('Create Flight')
      page.should have_text('1234')
      expect(Flight.first.name).to eq '1234'
      expect(Flight.first.plane).to eq plane
    end
  end
end


def login_admin
  user = User.create(name: 'admin', email: 'admin@gmail.com', password: 'a', password_confirmation: 'a', is_admin: true)
  visit root_path
  click_link('Login')
  fill_in('Email', :with => user.email)
  fill_in('Password', :with => 'a')
  click_button('Fly away!')
  click_link('Flights')
end