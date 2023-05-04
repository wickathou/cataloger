module Category_Utils

  def text_input(tag)
    puts"Please enter the #{tag}"
    input_value = gets.chomp
    if input_value.empty?
      puts 'Invalid input'
      return text_input(tag)
    end
    return input_value
  end
end