require_relative 'spec_utils'

require_relative './book'

describe Book do
  context 'create a book' do
    book = Book.new('things fall apart', 'bad', '04-05-2023')

    it 'return name of the publisher' do
      expect(book.publisher).to eq('things fall apart')
    end

    it 'return the state of the book' do
      expect(book.cover_state).to eq('bad')
    end

    it 'return publshing  date' do
      expect(book.publish_date).to eq('04-05-2023')
    end
  end
end
