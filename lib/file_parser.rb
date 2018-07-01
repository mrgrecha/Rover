module FileParser

  def get_data_from_file(filename)
    lines = File.read(filename).lines
    result = []
    size = get_size_of_map(lines.first).to_a
    lines.slice(1..lines.size).each_slice(2) do |rover_info_lines|
      result << format_output_data(get_coordinates_and_direction(rover_info_lines.first),
                                   get_instructions(rover_info_lines.last))
    end
    [size, result]
  end

  private

  def get_size_of_map(map_line)
    map_line.split.map(&:to_i)
  end

  def get_coordinates_and_direction(coordinates_line)
    split_line = coordinates_line.split
    [split_line.slice(0..1).map(&:to_i), split_line.last]
  end

  def get_instructions(instructions_line)
    instructions_line.chomp
  end

  def format_output_data(coordinates_and_direction, instructions)
    {
      coordinates_and_direction: coordinates_and_direction,
      instructions: instructions
    }
  end

end
