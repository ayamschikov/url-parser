# frozen_string_literal: true

FactoryBot.define do
  to_create(&:save)

  factory :site do
    title
    url
    status
  end
end
