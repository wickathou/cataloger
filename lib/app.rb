require_relative 'utils'

class App
  include Utilities
  def initialize
    @genres = []
    @authors = []
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
    when '1'..'6'
      listing_methods(option)
    when '7'..'9'
      creator_methods(option)
    else
      puts 'That is not a valid input or not yet implemented'
    end
  end

  def save_data
    SaveAuthorDecorator.new(@authors).save_routine
    SaveGenreDecorator.new(@genres).save_routine
    SaveLabelDecorator.new(@labels).save_routine
    SaveItemDecorator.new(@items).save_routine
  end

  def app_exit
    save_data
    puts 'Thank you for using the Catalog App!'
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
