require_relative 'author'
require 'securerandom'

class Item
  attr_reader :id, :genre, :author, :label, :publish_date, :archived
  def initialize(genre_array, author_array, label_array, id = nil)
    @id = id || SecureRandom.uuid
    puts 'Please select a genre'
    @genre = instance_selector(genre_array)
    puts 'Please select an author'
    @author = instance_selector(author_array, Author)
    @author.items << self unless author.items.include?(self)
    @publish_date = publish_date_input
    @archived = false 
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if Time.now.year - @publish_date > 10
    false
  end

  def publish_date_input
    puts 'Please enter the publish year'
    publish_date = gets.chomp.to_i
    if publish_date > Time.now.year
      puts 'Invalid date'
      return publish_date_input
    end
    return publish_date
  end

  def instance_selector(array, class_name = nil)
    array.each_with_index do |item, index|
      list_formatter(item, index)
    end
    puts "#{array.length} - create a new #{class_name || array[0].class}"
    selection = gets.chomp.to_i
    return array[selection] unless array[selection].nil?
    if selection == array.length
      new_instance = class_name.new 
      array << new_instance
      return new_instance
    else
      puts 'Invalid selection'
      return instance_selector(array)
    end
  end

  def list_formatter(item,index)
    case item.class.to_s
    when 'Author'
      puts "#{index} - #{item.first_name} #{item.last_name}"
    else
      puts "#{index} - #{item}"
    end
  end
end

# item = Item.new(['d','e'], ['a'], ['1','2'])
# puts item.inspect