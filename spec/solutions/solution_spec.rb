require 'spec_helper'

RSpec.describe Solution do
  let(:solution) { build(:solution) }
  let(:solution_with_incorrect_instructions) { build(:solution_with_incorrect_instructions) }
  let(:executor) { build(:command_executor) }

  describe '.solve' do
    it 'executes instruction preprocessing before solving' do
      allow(executor).to receive(:execute_instructions).and_return(nil)
      expect(solution).to receive(:preprocess_instructions)
      expect(executor).to receive(:execute_instructions)
      solution.with_executor(executor).solve
    end
  end
end
