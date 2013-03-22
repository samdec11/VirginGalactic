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
      page.should have_button('Cancel')
      page.should have_button('Fly away!')
    end
    it 'clears the login form when the Cancel button is clicked', :js => true do
      visit root_path
      click_link('Login')
      click_button('Cancel')
      page.should_not have_button('Cancel')
      page.should_not have_button('Fly away!')
    end
  end
  describe 'POST /login' do
    it 'logs the user into the system if credentials are correct', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'a')
      click_button('Fly away!')
      page.should_not have_link('Login')
      page.should_not have_link('Create Account')
      visit root_path
      page.should_not have_link('Login')
      page.should_not have_link('Create Account')
      page.should have_link('Logout')
    end
    it 'does not log the user into the system if credentials are incorrect', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'b')
      click_button('Fly away!')
      page.should have_link('Login')
      page.should have_link('Create Account')
    end
  end
  describe 'DELETE /login' do
    it 'logs the user out of the system', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Email', :with => user.email)
      fill_in('Password', :with => 'a')
      click_button('Fly away!')
      click_link('Logout')
      page.should have_link('Login')
      page.should have_link('Create Account')
    end
  end
end