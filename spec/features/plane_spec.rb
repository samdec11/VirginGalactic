require 'spec_helper'


describe 'plane features' do

describe '/plane' do
      it 'has a create plane button', js:true do
        visit planes_path
        page.should have_link('Create Plane')
      end
      it 'on click of create plane form shows GET /new' , js:true do
        visit planes_path
        click_link('Create Plane')
        page.should have_button('Create Plane')
        page.should have_link('Cancel')
        expect(find_link('Create Plane').visible?).to eq false
      end
    end

    describe 'Post /create' do
      it 'saves a plane',js:true do
        visit planes_path
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
        visit planes_path
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
        visit planes_path
        click_link('Create Plane')
        click_link('Cancel')
        page.should_not have_button('Create Plane')
        page.should_not have_link('Cancel')
      end

    end
end