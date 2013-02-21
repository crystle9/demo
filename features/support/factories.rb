require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email "qiujianrong@gmail.com"
    password "qjr01032"
    password_confirmation "qjr01032"
  end
end
