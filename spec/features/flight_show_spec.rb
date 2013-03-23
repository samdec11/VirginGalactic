require 'spec_helper'

describe 'Flight Show' do
  describe 'GET /flights/2', :js => true do
    it "displays a flight's show page" do
      login_as_regular_user
      page.should have_text('1234')
      page.should have_text('JFK')
      page.should have_text('LAX')
    end
  end

  private
  def login_as_regular_user
    user = FactoryGirl.create(:user)
    flight = FactoryGirl.create(:flight)
    visit root_path
    click_link('Login')
    fill_in('Email', :with => user.email)
    fill_in('Password', :with => 'a')
    sleep 5.seconds
    click_button('Fly away!')
    visit flight_path(flight)
  end
end