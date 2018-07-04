require 'spec_helper'

FactoryBot.define do
  factory :tokenize_solution_with_correct_instructions, class: 'TokenizeSolution' do
    instructions 'LMLMLMLMM'
    initialize_with { new(instructions: instructions) }
  end

  factory :tokenize_solution_for_checking_moving_forward_optimization, class: 'TokenizeSolution' do
    instructions 'LMMMMMR'
    initialize_with { new(instructions: instructions) }
  end

  factory :tokenize_solution_for_checking_orientation_optimization, class: 'TokenizeSolution' do
    instructions 'RMLLLMR'
    initialize_with { new(instructions: instructions) }
  end

  factory :tokenize_solution_with_incorrect_instructions, class: 'TokenizeSolution' do
    instructions 'LQWERMLRRMLMLMM'
    initialize_with { new(instructions: instructions) }
  end
end
