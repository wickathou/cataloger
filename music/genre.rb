class Genre
  attr_reader :id, :name, :items

  def initialize(name)
    @id = securerandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item unless @items.include?(item)
  end
end
