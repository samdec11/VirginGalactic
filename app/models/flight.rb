# == Schema Information
#
# Table name: flights
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  origin     :string(255)
#  dest       :string(255)
#  dep_time   :date
#  plane_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flight_num :integer
#

class Flight < ActiveRecord::Base
attr_accessible :flight_name,:flight_num, :origin,:dest,:dep_time
end
