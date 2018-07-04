require_relative './requirments'

include Helpers
include FileParser

TEST = false
filename = ARGV.first || './example_input.txt'
DEBUG_MODE = true?(ARGV[1])

MAP_SIZE, array_of_rover_data = get_data_from_file(filename)

array_of_rover_data.each do |data|
  executor = CommandExecutor.new(transport: Rover.new(coordinates_and_direction: data[:coordinates_and_direction]))
  TokenizeSolution.new(data).with_executor(executor).solve
  # LinearSolution.new(data).with_executor(executor).solve
end
