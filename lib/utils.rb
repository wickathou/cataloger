require_relative 'game'
require_relative 'item'
require_relative 'music'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'category_utils'
require_relative 'author'
require_relative 'save_decorator'

module Utilities
  def interface_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all authors'
    puts '6 - List all labels'
    puts '7 - Create a book'
    puts '8 - Create a music album'
    puts '9 - Create a game'
    puts '10 - Exit'
  end

  def listing_methods(input)
    case input
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
    end
  end

  def creator_methods(input)
    case input
    when '7'
      @items << Book.new(@genres, @authors, @labels)
    when '8'
      @items << MusicAlbum.new(@genres, @authors, @labels)
    when '9'
      @items << Game.new(@genres, @authors, @labels)
    end
  end

  def list_all_instances(array, class_name = nil)
    return puts 'No items' if (!class_name.nil? && array.empty?) || array.none? { |item| item.is_a?(class_name) }

    array.each_with_index do |item, index|
      if item.instance_of?(class_name)
        puts "#{index} - Item class: #{item.class}"
        class_name_lister(item, item.class)
      end
    end
  end

  def class_name_lister(item, class_name = nil)
    case class_name.to_s
    when 'Author'
      puts "First name: #{item.first_name} Last name: #{item.last_name}"
    when 'Genre'
      puts "Genre name: #{item.name}"
    when 'Label'
      puts "Title:#{item.title}-Color:#{item.color}"
    when 'Game'
      puts "Genre:#{item.genre.name}-Author:#{item.author.first_name}-Label:#{item.label}"
      puts "Multiplayer:#{item.multiplayer}-Played:#{item.last_played_date}-archived:#{item.archived}"
    when 'Book'
      puts "Genre:#{item.genre.name}-Author:#{item.author.first_name}-Published:#{item.publish_date}"
      puts "Label:#{item.label.title}-Cover state:#{item.cover_state}-archived:#{item.archived}"
    when 'MusicAlbum'
      puts "Genre:#{item.genre.name}-Author:#{item.author.first_name}-Published:#{item.publish_date}"
      puts "Label:#{item.label.title}-On spotify:#{item.on_spotify}-archived:#{item.archived}"
    end
  end
end
