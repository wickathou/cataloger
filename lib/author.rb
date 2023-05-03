require 'securerandom'

class Author
  attr_reader :id, :first_name, :last_name
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = SecureRandom.uuid
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
