require_relative 'author'
require 'securerandom'

class Item
  attr_reader :id, :genre, :author, :label, :publish_date, :archived
  def initialize(genre_array, author_array, label_array, id = nil)
    @id = id || SecureRandom.uuid
    @genre = instance_selector(genre_array)
    @author = instance_selector(author_array)
    @author.items << self unless author.items.include?(self)
    @label = instance_selector(label_array)
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

  def instance_selector(array)
    array.each_with_index do |item, index|
      list_formatter(item, index)
    end
    puts "#{array.length} - create a new #{array[0].class}"
    selection = gets.chomp.to_i
    if array[selection].nil? && selection != array.length
      puts 'Invalid selection'
      return instance_selector(array)
    end
    return array[selection] || array[0].class.new
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

item = Item.new(['d','e'], [Author.new], ['1','2'])
puts item.inspect