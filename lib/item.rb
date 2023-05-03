require 'securerandom'

class Item
  attr_reader :id, :genre, :author, :label, :publish_date, :archived
  def initialize(genre_array, author_array, label_array)
    @id = SecureRandom.uuid
    @genre = instance_selector(genre_array)
    @author = instance_selector(author_array)
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
      puts "#{index} - #{item}"
    end
    selection = gets.chomp.to_i
    if array[selection].nil?
      puts 'Invalid selection'
      return instance_selector(array)
    end
    return array[selection]
  end
end

# item = Item.new(['a', 'b', 'c'], ['d','e'], ['1','2'])
# puts item.inspect