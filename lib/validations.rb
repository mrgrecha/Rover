module Validations

  def validate_step(current_position)
    return if check_presence_on_map(current_position)
    raise RuntimeError, 'Transport is out of map'
  end

  private

  def check_presence_on_map(current_position)
    current_position.each.with_index do |coordinate, index|
      return false if coordinate > MAP_SIZE[index] || coordinate < 0
    end
  end
end
