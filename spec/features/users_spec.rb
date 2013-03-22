require 'spec_helper'

describe 'Users' do
  describe 'GET /' do
    it 'shows a link for creating a new user' do
      visit root_path
      page.should have_link('Create Account')
      page.should have_link('Login')
    end
  end
  describe 'GET /users/new' do
    it 'shows the create form when the Create Account button is clicked', :js => true do
      visit root_path
      click_link('Create Account')
      page.should have_button('Cancel')
      page.should have_button('Create User')
    end
    it 'clears the form when the cancel button is clicked', :js => true do
      visit root_path
      click_link('Create Account')
      click_button('Cancel')
      page.should_not have_button('Cancel')
      page.should_not have_button('Create User')
    end
  end
  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link("Create Account")
      fill_in('Name', :with => 'Bob')
      fill_in('Email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should_not have_button('Cancel')
      page.should_not have_button('Create User')
      expect(User.first.name).to eq 'Bob'
    end
  end
end