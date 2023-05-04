require_relative 'game'
require_relative 'item'
require_relative 'author'

module Utilities
  def interface_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all authors'
    puts '6 - Create a book'
    puts '7 - Create a music album'
    puts '8 - Create a game'
    puts '9 - Exit'
  end

  def list_all_instances(array)
    return puts 'No items' if array.empty?
    array.each_with_index do |item, index|
      puts "#{index} - Item class: #{item.class}"
      class_name_lister(item, item.class)
    end
  end

  def class_name_lister(item, class_name = nil)
    case class_name.to_s
    when 'Author'
      puts "#{item.first_name} #{item.last_name}"
    when 'Game'
      puts "Genre: #{item.genre} - Author: #{item.author.first_name} #{item.author.last_name}"
      puts "Publish date: #{item.publish_date} - Label: #{item.label}"
      puts "Multiplayer: #{item.multiplayer} - Last played: #{item.last_played_date} - archived: #{item.archived}"
    else
      puts "#{item}"
    end
  end
end