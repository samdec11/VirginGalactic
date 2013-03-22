class CreatePlaneTable < ActiveRecord::Migration
def change
  create_table :planes do |t|
    t.string :name
    t.integer :cols
    t.integer :rows
    t.timestamps
  end
end
end
