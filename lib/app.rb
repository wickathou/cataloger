require_relative 'utils'

class App
include Utilities
  def initialize
    @genres = ['a', 'b', 'c']
    @authors = []
    @labels = ['1', '2', '3']
    @items = []
    run
  end
  
  private

  def run
    app_loop
  end

  def option_selector(option)
    case option
    when '1'
      list_all_instances(@items, Book)
    when '3'
      list_all_instances(@items, Game)
    when '5'
      list_all_instances(@authors, Author)
    when '6'
      puts 'Input the book publisher'
      publisher = gets.chomp
      puts 'Input the book cover state'
      cover_state = gets.chomp
      @items << Book.new(@genres, @authors, @labels, publisher, cover_state)
    when '8'
      @items << Game.new(@genres, @authors, @labels)
    else
      puts 'That is not a valid input or not yet implemented'
    end
  end

  def app_exit
    puts 'Thank you for using the Library App!'
  end

  def app_loop
    loop do
      interface_menu
      option = gets.chomp
      if option == '9'
        app_exit
        break
      end
      option_selector(option)
    end
  end
end
