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

FactoryGirl.define do
  factory :flight, class: Flight do
    flight_num  1234
    origin      'NYC'
    dest        'LAX'
    date        '2013-04-20'
  end
end
