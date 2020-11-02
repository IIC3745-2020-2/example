# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John' }
    last_name { 'Doe' }
    sequence(:email) do |n|
      "johndoe#{n}@example.com"
    end
    password { '123456' }
    password_confirmation { '123456' }
  end
end
