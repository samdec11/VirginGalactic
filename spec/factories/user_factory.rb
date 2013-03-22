# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :user, class: User do
    name 'bob'
    email 'bob@gmail.com'
    password 'a'
    password_confirmation 'a'
    is_admin false
  end
end
