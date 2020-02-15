# frozen_string_literal: true

FactoryBot.define do
  sequence :string, aliases: %i[title] do |n|
    "title-#{n}"
  end

  sequence :status do
    rand(100..500).to_s
  end

  sequence :url do |n|
    "http://site-url#{n}.com"
  end
end
