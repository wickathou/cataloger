require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre_array, author_array, label_array)
    super(genre_array, author_array, label_array)
    @on_spotify = on_spotify_input
  end

  def on_spotify_input
    puts 'Is the music album on spotify? y/n'
    response = gets.chomp.downcase
    case response
    when 'y'
      true
    else
      false
    end
  end

  private

  def can_be_archived?
    return true if super && on_spotify
  end
end

# music = MusicAlbum.new(['a', 'b', 'c'], [Author.new], ['1','2'], true)
# puts music.inspect
