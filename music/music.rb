require_relative '/lib/item'

class MusicAlbum < item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date = 'unknown')
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
