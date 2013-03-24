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

class Flight < ActiveRecord::Base
  attr_accessible :name, :origin,:dest,:dep_time,:plane_id
  belongs_to :plane, :inverse_of => :flights
  has_many :seats, :inverse_of => :flight
  def create_seats(plane_id)
      self.plane_id = plane_id
      self.save
      self.plane.rows.times do |r|
        self.plane.cols.times do |c|
          self.seats << Seat.create(row:r, col:c,flight_id:self.id)
        end
      end
      self.save
  end

  def empty_seats
    self.seats.where(:user_id => nil).count
  end
end
