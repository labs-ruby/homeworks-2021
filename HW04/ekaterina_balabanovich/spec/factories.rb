# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    skip_create

    name { 'John' }
    surname { 'Doe' }

    initialize_with { new(name, surname) }
  end

  factory :homework do
    skip_create

    title { 'HW01' }
    description { 'do it' }

    initialize_with { new(title, description) }
  end

  factory :member do
    skip_create

    name { 'John' }
    surname { 'Doe' }

    initialize_with { new(name, surname) }
  end
end
