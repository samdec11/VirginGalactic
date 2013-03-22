require 'spec_helper'


describe 'Planes' do

  describe '/plane' do
    it 'has a create plane button', js:true do
      login_admin
      visit planes_path
      visit planes_path
      visit planes_path
      visit planes_path
      page.should have_link('Create Plane')
    end
    it 'on click of create plane form shows GET /new' , js:true do
      login_admin
      click_link('Create Plane')
      page.should have_button('Create Plane')
      page.should have_link('Cancel')
      expect(find_link('Create Plane').visible?).to eq false
    end
  end

  describe 'Post /create' do
    it 'saves a plane',js:true do
      login_admin
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
      #expecting the create!
      expect(Plane.first.name).to eq pl.name
    end
    it 'does not save a plane with missing name,row,col',js:true do
      login_admin
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => "") #No row!
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      #expecting the create!
      expect(Plane.first).to eq nil
    end
   # it 'hides form on create',js:true do
   # end
    it 'Cancel Button on form removes form', js:true do
      login_admin
      click_link('Create Plane')
      click_link('Cancel')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
    end

    it 'should create a new plane', :js => true do
      login_admin
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should have_text('Baby Plane')
    end

    it 'should show the number of seats', :js => true do
      login_admin
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      result = 8
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should have_text('Baby Plane')
      seats.matches_count?(result)
    end

    it 'has a plane selector', :js => true do
      login_admin
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      click_link('Create Plane')
      p2 = Plane.new(name:"Mama Plane",rows:4,cols:8)
      fill_in('plane_name', :with => p2.name)
      fill_in('plane_rows', :with => p2.rows)
      fill_in('plane_cols',with:p2.cols)
      click_button('Create Plane')
      page.should have_selector('plane_select, :count => 2')
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
  visit planes_path
end