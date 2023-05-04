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

  def list_all_instances(array, class_name = nil)
    return puts 'No items' if array.empty? || array.none? { |item| item.is_a?(class_name)} unless class_name.nil?
    array.each_with_index do |item, index|
      if item.class == class_name
        puts "#{index} - Item class: #{item.class}"
        class_name_lister(item, item.class)
      elsif class_name.nil?
        puts "#{index} - #{item}"
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
      puts "Title: #{item.title} - Color: #{item.color}"
    when 'Game'
      puts "Genre: #{item.genre} - Author: #{item.author.first_name} #{item.author.last_name}"
      puts "Publish date: #{item.publish_date} - Label: #{item.label}"
      puts "Multiplayer: #{item.multiplayer} - Last played: #{item.last_played_date} - archived: #{item.archived}"
    when 'Book'
      puts "Genre: #{item.genre} - Author: #{item.author.first_name} #{item.author.last_name}"
      puts "Publish date: #{item.publish_date} - Label: #{item.label}"
      puts "Publisher: #{item.publisher} - Cover state: #{item.cover_state} - archived: #{item.archived}"
    when 'MusicAlbum'
      puts "Genre: #{item.genre} - Author: #{item.author.first_name} #{item.author.last_name}"
      puts "Publish date: #{item.publish_date} - Label: #{item.label}"
      puts "On spotify:#{item.on_spotify} - archived: #{item.archived}"
    else
      puts "#{item}"
    end
  end
end
