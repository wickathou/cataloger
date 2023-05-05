require_relative 'item'

class Book < Item 
  attr_accessor :publisher, :cover_state
  def initialize(genre_array, author_array, label_array)
    super(genre_array, author_array, label_array)
    @publisher = publisher
    @cover_state = cover_state
  end

  private
  
  def can_be_archived?
      super || @cover_state == 'bad'
  end

  def publisher
    puts 'Input the book publisher'
      publisher = gets.chomp
  end

  def cover_state
    puts 'Input the book cover state'
      cover_state = gets.chomp
  end
end

# book = Book.new(['a', 'b', 'c'], [Author.new], ['1','2'], 'publisher', 'cover_state')
# puts book.inspect