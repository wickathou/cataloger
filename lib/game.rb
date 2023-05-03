require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_date
  def initialize(genre_array, author_array, label_array)
    super(genre_array, author_array, label_array)
    @multiplayer = is_multiplayer?
    @last_played_date = last_played_date_input
  end

  
  private
  
  def can_be_archived?
    return true if Time.now.year - @last_played_date > 2 && super
    false
  end

  def is_multiplayer?
    puts 'Is this game multiplayer? (y/n)'
    multiplayer = gets.chomp.downcase
    case multiplayer
    when 'y'
      return true
    when 'n'
      return false
    else
      puts 'Invalid input'
      return is_multiplayer?
    end
  end

  def last_played_date_input
    puts 'Please enter the last year you played the game'
    last_played_date = gets.chomp.to_i
    if last_played_date > Time.now.year || last_played_date < @publish_date
      puts 'Invalid date'
      return last_played_date_input
    end
    return last_played_date    
  end

end

# game = Game.new(['a', 'b', 'c'], ['d','e'], ['1','2'])
# puts game.inspect