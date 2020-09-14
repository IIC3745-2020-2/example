# frozen_string_literal: true

FactoryBot.define do
  factory :commit do
    repository
    sha { 'ec26c3e57ca3a959ca5aad62de7213c562f8c821' }
    message { 'Update README.md' }
    pusher { 'Codertocat' }
    ref { 'refs/heads/master' }
    pushed_at { 1557933657 }
  end
end
