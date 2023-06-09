require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre_array, author_array, label_array)
    super(genre_array, author_array, label_array)
    @publisher = publisher_input
    @cover_state = cover_state_input
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def publisher_input
    puts 'Input the book publisher'
    gets.chomp
  end

  def cover_state_input
    puts 'Input the book cover state'
    gets.chomp
  end
end
