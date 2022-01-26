# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    url { 'https://google.com' }

    trait :with_slug do
      slug { 'google' }
    end
  end
end
