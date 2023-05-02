require_relative 'utils'

class main
include Utilities
  def initialize
    @genres = []
    @authors = []
    @sources = []
    @labels = []
    @items = []
  end

  def run
    app_loop
  end

  def option_selector(option)
    case option
    when %w[1 2 3 4 5 6 7 8 9].include?(option)
      puts 'Not implemented yet'
    when '10'
      app_exit
    else
      puts 'That is not a valid input'
    end
  end

  def app_exit
    save_data
    puts 'Thank you for using the Library App!'
  end

  def app_loop
    loop do
      interface_menu
      option = gets.chomp
      if option == '7'
        app_exit
        break
      end
      option_selector(option)
    end
  end
end