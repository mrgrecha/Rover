require 'spec_helper'

FactoryBot.define do
  factory :command_executor do
    initialize_with { new(transport: build(:rover)) }
  end
end
