# == Schema Information
#
# Table name: planes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  cols       :integer
#  row        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :plane, class: Plane do
    name    '747'
    rows    '4'
    columns '20'
  end
end
