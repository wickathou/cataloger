require_relative 'category_utils'
require 'securerandom'

class Label
include Category_Utils
    attr_accessor :id, :title, :color, :items
    def initialize
        @id = SecureRandom.uuid
        @title = text_input('title')
        @color = text_input('color')
        @items = []
    end
    def add_item(item)
        @items << item
        item.label = self
    end
end

# label = Label.new
# puts label.inspect