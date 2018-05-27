class StepLogger < MethodDecorators::Decorator
  def call(wrapped, this, *args, &blk)
    wrapped.call(*args, &blk)
    log_step(this.current_position, this.current_orientation) if DEBUG_MODE
  end

  private

  def log_step(current_position, current_orientation)
     puts "Your current position is #{current_position.join(' ')} and orientation is #{current_orientation}."
  end
end
