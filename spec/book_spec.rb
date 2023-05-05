require 'minitest/autorun'
require 'rspec'
require_relative '../lib/book'

class TestBookAlbum < Minitest::Test
  def setup
    @genre = ['Fiction']
    @author = ['james']
    @label = ['script']
    
  end

  def test_can_be_archived_returns_true_when_cover_state_is_bad
  #  @book.cover_state = 'bad'
   @book = Book.new('fiction', 'victor', 'script')
   assert_true(@book.can_be_archived)
  end

  # def test_can_be_archived_returns_false_when_cover_state_is_good
  #   @book.cover_state = 'good'
  #   assert_true(@book.can_be_archived)
  # end

#   def test_can_be_archived_returns_true_when_superclass_method_returns_true
#      def @book.can_be_archived
#       true
#   end
#   @book.cover_state = 'good'
#   assert_true(@book.can_be_archived)
# end
end