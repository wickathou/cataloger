module Utilities
  def interface_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all labels'
    puts '5 - List all genres'
    puts '6 - List all authors'
    puts '7 - Create a book'
    puts '8 - Create a music album'
    puts '9 - Create a game'
    puts '10 - Exit'
  end

  def input_prompt(arr)
    (0..arr.length - 1).each do |i|
      puts("#{arr.at(i)}:")
      arr[i] = gets.chomp
    end
    arr
  end

end