# == Schema Information
#
# Table name: seats
#
#  id         :integer          not null, primary key
#  row        :integer
#  col        :integer
#  flight_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :seat, class: Seat do
    row  4
    col  20
  end
end
