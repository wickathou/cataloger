require_relative 'category_utils'
require 'securerandom'

class Author
include Category_Utils
  attr_reader :id, :first_name, :last_name
  attr_accessor :items
  def initialize(id=nil)
    @id = id || SecureRandom.uuid
    @first_name = text_input('firstname')
    @last_name = text_input('lastname')
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end
end


# author = Author.new
# puts author.inspect