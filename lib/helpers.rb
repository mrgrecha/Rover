module Helpers
  def true?(object)
    object.to_s == 'true'
  end
  
  def add_transport_to_input_data(array_of_input_data, transport_class)
    array_of_input_data.each do |input_data|
      input_data[:transport] = transport_class.new(coordinates_and_direction: input_data[:coordinates_and_direction])
    end
  end
end
