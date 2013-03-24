require 'spec_helper'

describe 'Flight Show' do
  describe 'GET /flights/2', :js => true do
    it "displays a flight's show page" do
      login_as_regular_user
      page.should have_text('1234')
      page.should have_text('JFK')
      page.should have_text('LAX')
    end
    it 'shows the seats for a flight' do
      login_as_regular_user
      page.should have_css('table tr td .empty')
    end
  end
  describe 'POST /seats/3/reserve', :js => true do
    it 'reserves the seat for the user' do
      login_as_regular_user
      find('tr:first-child').find('td:first-child').find('.empty:first-child').click
    end
  end

  private
  def login_as_regular_user
    user = FactoryGirl.create(:user)
    flight = FactoryGirl.create(:flight)
    plane = FactoryGirl.create(:plane)
    flight.plane = plane
    flight.save
    flight.create_seats(flight.plane_id)
    visit root_path
    click_link('Login')
    click_link('Login Here')
    fill_in('login_email', :with => user.email)
    fill_in('login_password', :with =>user.password)
    click_button('Fly away!')
    visit flight_path(flight)
  end
end