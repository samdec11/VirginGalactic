class Plane < ActiveRecord::Base
attr_accessible :name,:rows,:cols
has_many :flights
end