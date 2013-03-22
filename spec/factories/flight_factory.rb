FactoryGirl.define do
  factory :flight, class: Flight do
    name      '1234'
    origin      'NYC'
    dest        'LAX'
    dep_time        '2013-04-20'
  end
end