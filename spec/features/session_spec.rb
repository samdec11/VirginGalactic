require 'spec_helper'

describe 'Session' do
  let(:user) {FactoryGirl.create(:user)}
  describe 'GET /' do
    it 'displays login link' do
      visit root_path
      page.should have_link('Login')
    end
  end
  describe 'GET /login' do
    it 'displays the login form', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Create User')
      page.should have_button('Login')
    end
    it 'clears the login form when the hide button is clicked', :js => true do
      visit root_path
      click_link('Login')
      click_link('Hide')
      page.should have_link('Login')
    end
  end
  describe 'POST /login' do
    it 'logs the user into the system if credentials are correct', :js => true do
      visit root_path
      click_link('Login')
      fill_in('login_email', :with => user.email)
      fill_in('login_password', :with => 'a')
      click_button('Login')
      page.should_not have_button('Login')
      page.should_not have_button('Create Account')
      visit root_path
      page.should have_text('Welcome')
      page.should have_link('Logout')
    end
    it 'does not log the user into the system if credentials are incorrect', :js => true do
      visit root_path
      click_link('Login')
      fill_in('login_email', :with => user.email)
      fill_in('login_password', :with => 'b')
      click_button('Login')
      page.should have_button('Login')
      page.should have_button('Create User')
    end
  end
  describe 'DELETE /login' do
    it 'logs the user out of the system', :js => true do
      visit root_path
      click_link('Login')
      fill_in('login_email', :with => user.email)
      fill_in('login_password', :with => 'a')
      click_button('Login')
      page.should have_text('Welcome')
      click_link('Logout')
      page.should have_link('Login')
    end
  end
end