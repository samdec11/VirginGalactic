# == Schema Information
#
# Table name: planes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  cols       :integer
#  rows       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plane < ActiveRecord::Base
  attr_accessible :name,:rows,:cols
  validates :name, :rows, :cols, :presence => true
  has_many :flights, :inverse_of => :plane
end
