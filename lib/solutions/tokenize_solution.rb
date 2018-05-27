class TokenizeSolution < Solution

  def post_initialize
    devide_instruction_to_tokens
  end

  def solve
    
  end

  private

  def devide_instruction_to_tokens
    binding.pry
    @tokens = instructions.split(/[L,R]/)
  end
end
