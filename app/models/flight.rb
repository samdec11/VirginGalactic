class Flight < ActiveRecord::Base
attr_accessible :name, :origin,:dest,:dep_time
end