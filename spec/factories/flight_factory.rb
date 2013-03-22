FactoryGirl.define do
  factory :flight, class: Flight do
    flight_num  1234
    origin      'NYC'
    dest        'LAX'
    date        '2013-04-20'
  end
end