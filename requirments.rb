require 'Matrix'
require 'method_decorators'
require 'pry'
require_relative 'lib/validations'
require_relative 'lib/step_logger'
require_relative 'lib/solutions/solution'

Dir['./lib/**/*.rb'].each { |file| require_relative file }
