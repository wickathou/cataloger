require './item'

class book < item 
    attr_accessor :publisher, :cover_state
    def initialize(genre, author, source, label, publish_date, publisher, cover_state)
        super(genre, author, source, label, publish_date)
@publisher = publisher,
@cover_state = cover_state
end

def can_be_archived
    super || @cover_state == 'bad'
end
end