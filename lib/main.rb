require_relative 'utils'

class Main
include Utilities
  def initialize
    @genres = []
    @authors = []
    @sources = []
    @labels = []
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
      puts 'Not implemented yet'
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
      if option == '10'
        app_exit
        break
      end
      option_selector(option)
    end
  end
end