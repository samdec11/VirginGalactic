class CreateSeatsTable < ActiveRecord::Migration
def change
  create_table :seats do |t|
    t.integer :row
    t.integer :col
    t.integer :flight_id
    t.integer :user_id
    t.timestamps
  end
end
end