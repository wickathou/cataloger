require 'json'

class SaveDecorator
  attr_accessor :instances, :hash

  def initialize(instances)
    @instances = instances
    @hash = {}
  end

  def to_json(*_args)
    JSON.pretty_generate(@hash)
  end

  def hash_generator
    raise NotImplementedError, 'method not implemented yet'
  end

  def save_routine
    hash_generator
    save_json
  end

  def save_json
    raise NotImplementedError, 'method not implemented yet'
  end
end

class SaveAuthorDecorator < SaveDecorator
  def hash_generator
    @instances.each do |instance|
      @hash[instance] = {
        id: instance.id,
        first_name: instance.first_name,
        last_name: instance.last_name,
        item_ids: instance.items.map(&:id)
      }
    end
  end

  def save_json
    File.write('./data/authors.json', to_json)
  end
end

class SaveLabelDecorator < SaveDecorator
  def hash_generator
    @instances.each do |instance|
      @hash[instance] = {
        id: instance.id,
        title: instance.title,
        color: instance.color,
        item_ids: instance.items.map(&:id)
      }
    end
  end

  def save_json
    File.write('./data/labels.json', to_json)
  end
end

class SaveGenreDecorator < SaveDecorator
  def hash_generator
    @instances.each do |instance|
      @hash[instance] = {
        id: instance.id,
        name: instance.name,
        item_ids: instance.items.map(&:id)
      }
    end
  end

  def save_json
    File.write('./data/genres.json', to_json)
  end
end

class SaveItemDecorator < SaveDecorator
  def hash_generator
    @instances.each do |instance|
      @hash[instance] = {
        id: instance.id,
        item_class: instance.class.to_s,
        genre: {
          genre_id: instance.genre.id,
          genre_name: instance.genre.name
        },
        author: {
          author_id: instance.author.id,
          author_first_name: instance.author.first_name,
          author_last_name: instance.author.last_name
        },
        label: {
          label_id: instance.label.id,
          label_title: instance.label.title,
          label_color: instance.label.color
        },
        publish_date: instance.publish_date,
        archived: instance.archived,
        class_properties: class_properties_generator(instance)
      }
    end
  end

  def save_json
    File.write('./data/items.json', to_json)
  end
end

def class_properties_generator(instance)
  case instance.class.to_s
  when 'Book'
    book_class(instance)
  when 'Game'
    game_class(instance)
  when 'MusicAlbum'
    music_class(instance)
  else
    raise NotImplementedError, 'Instance class not implemented yet'
  end
end

def book_class(instance)
  {
    publisher: instance.publisher,
    cover_state: instance.cover_state
  }
end

def game_class(instance)
  {
    multiplayer: instance.multiplayer,
    last_played_date: instance.last_played_date
  }
end

def music_class(instance)
  {
    on_spotify: instance.on_spotify
  }
end

# class SaveGameDecorator < SaveItemDecorator
#   def hash_generator
#     @instances.each do |instance|
#       @hash[instance] = {
#         id: instance.id,
#         multiplayer: instance.multiplayer,
#         last_played_date: instance.last_played_date,
#         items: instance.items.map(&:id)
#       }
#     end
#   end

#   def save_json
#     File.write('./data/authors.json', to_json)
#   end
# end
