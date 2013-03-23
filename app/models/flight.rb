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

  def create_plane(params)
   @flight = Flight.create(params[:flight])
   @flight.plane_id = params[:plane_select]
   @flight.save
 end


end

