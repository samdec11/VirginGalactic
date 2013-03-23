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

class Seat < ActiveRecord::Base
  attr_accessible :row, :col, :user_id, :flight_id
  belongs_to :flight, :inverse_of => :seats
  belongs_to :user, :inverse_of => :seats
end
