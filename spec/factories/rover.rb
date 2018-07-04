require 'spec_helper'

FactoryBot.define do
  factory :rover, class: 'Rover' do
    coordinates [1, 2]
    direction 'N'
    initialize_with { new(coordinates_and_direction: [coordinates, direction]) }
  end

  factory :invalid_rover, class: 'Rover' do
    coordinates [1, 2]
    direction 'P'
    initialize_with { new(coordinates_and_direction: [coordinates, direction]) }
  end
end
