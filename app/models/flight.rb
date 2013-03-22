class Flight < ActiveRecord::Base
attr_accessible :flight_name,:flight_num, :origin,:dest,:dep_time
end