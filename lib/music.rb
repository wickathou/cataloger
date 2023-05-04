require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre_array, author_array, label_array, on_spotify = false)
    super(genre_array, author_array, label_array)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    return true if super && on_spotify
  end
end

music = MusicAlbum.new(['a', 'b', 'c'], [Author.new], ['1','2'], true)
puts music.inspect