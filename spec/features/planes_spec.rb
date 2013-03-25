require 'spec_helper'


describe 'Planes' do

  describe '/plane' do
    it 'has a create plane button', js:true do
      login_admin
      page.should have_text('Welcome')
      page.should have_link('Planes')
    end
    it 'on click of create plane form shows GET /new' , js:true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      page.should have_link('Create Plane')
      click_link('Create Plane')
      page.should have_link('Cancel')
      page.should have_button('Create Plane')
    end
  end

  describe 'Post /create' do
    it 'saves a plane', js:true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
      #expecting the create!
      expect(Plane.last.name).to eq pl.name
    end
    it 'does not save a plane with missing name,row,col',js:true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => "") #No row!
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      #expecting the create!
      expect(Plane.all[1]).to eq nil
    end
   # it 'hides form on create',js:true do
   # end
    it 'Cancel Button on form removes form', js:true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      click_link('Create Plane')
      click_link('Cancel')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
    end

    it 'should create a new plane', :js => true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
      page.should have_text('Baby Plane')
    end

    it 'should show the number of seats', :js => true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
      click_link('Create Plane')
      pl = Plane.new(name:"Baby Plane",rows:2,cols:4)
      result = 8
      fill_in('plane_name', :with => pl.name)
      fill_in('plane_rows', :with => pl.rows)
      fill_in('plane_cols',with:pl.cols)
      click_button('Create Plane')
      page.should_not have_button('Create Plane')
      page.should_not have_link('Cancel')
      page.should have_text('Baby Plane')
     # seats.matches_count?(result)
    end

    it 'has a plane selector', :js => true do
      login_admin
      page.should have_text('Welcome')
      click_link('Planes')
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
      #page.should have_selector('plane_select, :count => 2')
    end
  end
  private
  def login_admin
    user = User.create(name: 'admin', email: 'admin@gmail.com', password: 'a', password_confirmation: 'a', is_admin: true)
    visit root_path
    click_link('Login')
    fill_in('login_email', :with => user.email)
    fill_in('login_password', :with => 'a')
    click_button('Login')
  end
end