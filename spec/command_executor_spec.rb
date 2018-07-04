require 'spec_helper'

RSpec.describe CommandExecutor do
  let(:executor) { build(:command_executor) }

  describe '.execute_instructions' do
    it "executes turing left when get 'L' instruction" do
      expect(executor.transport).to receive(:turn_left)
      executor.execute_instructions(['L'])
    end

    it "executes turing right when get 'R' instruction" do
      expect(executor.transport).to receive(:turn_right)
      executor.execute_instructions(['R'])
    end

    it 'executes moving forward when get an integer' do
      expect(executor.transport).to receive(:move).with(2)
      executor.execute_instructions([2])
    end

    it 'raises an error if instruction is incorrect' do
      expect { executor.execute_instructions(['foo']) }.to raise_error(ArgumentError)
    end
  end
end
