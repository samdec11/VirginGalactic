require 'spec_helper'

describe 'Users' do
  describe 'GET /' do
    it 'shows a link for creating a new user' do
      visit root_path
      click_link('Login')
      page.should have_button('Login')
    end
  end
  describe 'GET /users/new' do
    it 'shows the create form when the Create Account button is clicked', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Create User')
    end
    it 'clears the form when the hide button is clicked', :js => true do
      visit root_path
      click_link('Login')
      page.should have_button('Create User')
      click_link('Hide')
      page.should have_link('Login')
    end
  end
  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Name', :with => 'bob')
      fill_in('reg_email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should have_link('Login')
      page.should have_link('Hide')
      expect(User.first.name).to eq 'bob'
    end
  end
end