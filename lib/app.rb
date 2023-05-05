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
    when '0'
      list_all_instances(@items)
    when '1'
      list_all_instances(@items, Book)
    when '2'
      list_all_instances(@items, MusicAlbum)
    when '3'
      list_all_instances(@items, Game)
    when '4'
      list_all_instances(@genres, Genre)
    when '5'
      list_all_instances(@authors, Author)
    when '6'
      list_all_instances(@labels, Label)
    when '7'
      @items << Book.new(@genres, @authors, @labels)
    when '8'
      puts 'Is the music album on spotify? y/n'
      on_spotify = gets.chomp.downcase
      case on_spotify
      when 'y'
        on_spotify = true
      else
        on_spotify = false
      end
      @items << MusicAlbum.new(@genres, @authors, @labels, on_spotify)
    when '9'
      @items << Game.new(@genres, @authors, @labels)
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
