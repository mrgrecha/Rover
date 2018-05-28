class Solution
  attr_reader :instructions, :command_executor

  def initialize(args)
    @instructions = args[:instructions]
    post_initialize
  end

  def with_executor(executor)
    @command_executor = executor
    self
  end

  def solve
    preprocess_instructions
    command_executor.execute_instructions(instructions)
  end

  protected

  def post_initialize; end

  def preprocess_instructions; end
end
