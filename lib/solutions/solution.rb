class Solution
  attr_reader :instructions, :transport
  
  def initialize(args)
    @instructions = args[:instructions]
    @transport = args[:transport]
    post_initialize
  end

  def solve
    preprocess_instructions
    transport.execute_instructions(instructions)
  end
  
  protected

  def post_initialize; end

  def preprocess_instructions; end
end
