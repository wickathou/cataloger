require_relative 'spec_utils'

describe Author do
  context 'when initialized' do
    author = Author.new('Leo', 'Tolstoy')
    it 'has a first name' do
      expect(author.first_name).to eq('Leo')
      expect(author.last_name).to eq('Tolstoy')
    end
    it 'has no items' do
      expect(author.items).to eq([])
    end
    it 'has one item' do
      author.add_item(Item.new('War and Peace', author, 'book', 'Penguin', '2010'))
      expect(author.items.length).to eq(1)
    end
  end
end