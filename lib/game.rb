require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_date

  def initialize(genre, author, source, label, publish_date, last_played_date, multiplayer = false)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_date = last_played_date
  end

  def can_be_archived?
    return true if Time.now.year - @last_played_date > 2 && super

    false
  end
end
