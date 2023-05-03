require 'securerandom'

class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items
  def initialize(id=nil)
    @id = id || SecureRandom.uuid
    @first_name = text_input('first')
    @last_name = text_input('last')
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end

  private

  def text_input(tag)
    puts"Please enter the author #{tag} name"
    input_value = gets.chomp
    if input_value.empty?
      puts 'Invalid name'
      return name_input
    end
    return input_value
  end
end

# author = Author.new
# puts author.inspect