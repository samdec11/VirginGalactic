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
#

FactoryGirl.define do
  factory :flight, class: Flight do
    name      '1234'
    origin      'JFK'
    dest        'LAX'
    dep_time        '2013-04-20'
  end
end
