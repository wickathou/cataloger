require_relative 'category_utils'
require 'securerandom'

class Genre
  include CategoryUtils
  attr_reader :id, :name, :items

  def initialize
    @id = SecureRandom.uuid
    @name = text_input('genre name')
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end
end
