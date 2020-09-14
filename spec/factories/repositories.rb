# frozen_string_literal: true

FactoryBot.define do
  factory :repository do
    name { 'Hello-World' }
    full_name { 'Codertocat/Hello-World' }
    url { 'https://github.com/Codertocat/Hello-World' }
  end
end
