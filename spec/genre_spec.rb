require 'minitest/autorun'
require_relative '../lib/genre'
require_relative '../lib/item'

class TestGenre < Minitest::Test
  def setup
    @genre = Genre.new
    @item1 = Item.new("Item 1")
    @item2 = Item.new("Item 2")
  end

  def test_genre_attributes
    assert @genre.id
    assert @genre.name
    assert @genre.items.is_a?(Array)
    assert @genre.items.empty?
  end

  def test_add_item_to_genre
    assert_empty @genre.items

    @genre.add_item(@item1)
    assert_includes @genre.items, @item1

    @genre.add_item(@item2)
    assert_includes @genre.items, @item2
  end

  def test_add_duplicate_item_to_genre
    @genre.add_item(@item1)
    assert_includes @genre.items, @item1

    # Add the same item again and make sure it's not added twice
    @genre.add_item(@item1)
    assert_equal 1, @genre.items.size
  end
end
