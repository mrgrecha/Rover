require 'spec_helper'

RSpec.describe TokenizeSolution do
  let(:tokenize_solution_with_correct_instructions) { build(:tokenize_solution_with_correct_instructions) }
  let(:tokenize_solution_with_incorrect_instructions) { build(:tokenize_solution_with_incorrect_instructions) }
  let(:tokenize_solution_for_checking_moving_forward_optimization) { build(:tokenize_solution_for_checking_moving_forward_optimization) }
  let(:tokenize_solution_for_checking_orientation_optimization) { build(:tokenize_solution_for_checking_orientation_optimization) }

  let(:executor) { build(:command_executor) }

  describe '.preprocess_instructions' do
    it 'returns array of valid instuctions' do
      expect(tokenize_solution_with_correct_instructions.preprocess_instructions).to satisfy { |instructions| instructions.all? { |i| i.is_a?(Integer) || i == 'L' || i == 'R' } }
    end

    it 'raises an error if instuctions are invalid' do
      expect { tokenize_solution_with_incorrect_instructions.preprocess_instructions }.to raise_error(ArgumentError)
    end

    it 'optimizes moving forward and returns an integer instead of M instuctions' do
      expect(tokenize_solution_for_checking_moving_forward_optimization.preprocess_instructions).to eq(['L', 5, 'R'])
    end

    it 'optimizes an orientation if there are some orientational instructions in a row' do
      expect(tokenize_solution_for_checking_orientation_optimization.preprocess_instructions).to eq(['R', 1, 'R', 1, 'R'])
    end
  end
end
