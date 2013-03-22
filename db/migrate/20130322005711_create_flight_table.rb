class CreateFlightTable < ActiveRecord::Migration
def change
  create_table :flights do |t|
    t.string :name
    t.string :origin
    t.string :dest
    t.date :dep_time
    t.integer :plane_id
    t.timestamps
  end
end
end
