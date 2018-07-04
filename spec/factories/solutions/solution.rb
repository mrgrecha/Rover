require 'spec_helper'

FactoryBot.define do
  factory :solution do
    instructions 'LMLRRMLMLMM'
    initialize_with { new(instructions: instructions) }
  end
end
