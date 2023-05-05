require 'minitest/autorun'
require_relative '../lib/music'

class TestMusicAlbum < Minitest::Test
  def setup
    @genre = ['Rock']
    @author = ['Linkin Park']
    @label = ['Lost']
    @on_spotify = true
    @album = MusicAlbum.new(@genre, @author, @label,
                            @on_spotify)
  end

  def test_music_album_attributes
    assert_equal @genre, @album.genre
    assert_equal @author, @album.author
    assert_equal @label, @album.label
    assert_equal @on_spotify, @album.on_spotify
  end

  def test_music_album_archival_status
    assert_equal true, @album.can_be_archived?
    @album.on_spotify = false
    assert_equal false, @album.can_be_archived?
  end
end
