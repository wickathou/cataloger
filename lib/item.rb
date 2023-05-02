require 'securerandom'

class Item
  attr_reader :id
  def initialize(genre, author, source, label, publish_date)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false 
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private
  def can_be_archived?
    return true if @publish_date - Time.now.year > 10
    false
  end
end