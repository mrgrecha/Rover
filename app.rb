require 'pry'
require 'Matrix'
require 'method_decorators'
require_relative 'lib/helpers'
require_relative 'lib/command_executor'
require_relative 'lib/file_parser'
require_relative 'lib/validations'
require_relative 'lib/step_logger'
require_relative 'lib/rover'
require_relative 'lib/solutions/solution'
require_relative 'lib/solutions/linear_solution'
require_relative 'lib/solutions/tokenize_solution'

include Helpers
include FileParser

filename = ARGV.first
DEBUG_MODE = true?(ARGV[1])

MAP_SIZE, array_of_rover_data = get_data_from_file(filename)

array_of_rover_data.each do |data|
  executor = CommandExecutor.new(transport: Rover.new(coordinates_and_direction: data[:coordinates_and_direction]))
  LinearSolution.new(data).with_executor(executor).solve
end
