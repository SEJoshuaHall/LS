class Diamond
  def self.make_diamond(letter)
    result = ''

    # set_array
    array = []
    if letter == 'A'
      array << 'A'
    else
      ('A'..letter).to_a.each do |letter|
        array << letter
      end
    end
    
    # get_length
    length = (array.size * 2) - 1
    
    # print_diamond_top
    array.each_with_index do |letter, index|
      if letter == 'A'
        result << "#{' ' * (length/2)}#{letter}#{' ' * (length/2)}\n"
      else
        result << "#{' ' * ((length/2) - index)}#{letter}#{' ' * ((index * 2) - 1)}#{letter}#{' ' * ((length/2) - index)}\n"
      end
    end

    # print_diamond_bottom
    padding = length - 4
    array = array.reverse
    array.shift
    counter = 1
    array.each do |letter|
      if letter == 'A'
        result << "#{' ' * counter}#{letter}#{' ' * counter}\n"
      else
        result << "#{' ' * counter}#{letter}#{' ' * (padding)}#{letter}#{' ' * counter}\n"
      end
      padding -= 2
      counter += 1
    end
    result
  end
end

p Diamond.make_diamond('B')