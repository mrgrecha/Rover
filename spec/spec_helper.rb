require 'pry'
require 'factory_bot'
require_relative '../requirments'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

# Constants
DEBUG_MODE = false
TEST = true
MAP_SIZE = [10, 10]
