require 'spec_helper'

RSpec.describe Rover do
  let(:rover) { build(:rover) }
  let(:invalid_rover) { build(:invalid_rover) }

  describe '.turn_left' do
    it 'changes orientation of rover' do
      rover.turn_left
      expect(rover.current_orientation).to eq('W')
    end
  end

  describe '.turn_right' do
    it 'changes orientation of rover' do
      rover.turn_right
      expect(rover.current_orientation).to eq('E')
    end
  end

  describe '.move' do
    it 'moves forward' do
      rover.move(1)
      expect(rover.current_position).to eq([1, 3])
    end

    it 'raises error if rover is out of map' do
      expect { rover.move(30) }.to raise_error(RuntimeError, 'Transport is out of map')
      expect { rover.move(-5) }.to raise_error(RuntimeError, 'Transport is out of map')
    end

    it 'raises error if current orientation is incorrect' do
      expect { invalid_rover.move(1) }.to raise_error(ArgumentError)
    end
  end
end
