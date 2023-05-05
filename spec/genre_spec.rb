require_relative 'spec_utils'

describe Genre do
  let(:genre) {Genre.new}
  before do
    allow_any_instance_of(Genre).to receive(:text_input).and_return('Genre name')
  end
  context 'when initialized' do
    
    it 'has a first name and last name' do
      expect(genre.id.length).to eq(36)
      expect(genre.name).to eq('Genre name')
    end
  end

  context 'when adding an item' do
    
    let(:item) {double('item', genre: nil)}
    before do
      allow(item).to receive(:genre=).with(genre).and_return(genre)
    end
    
    it 'adds the item to the genre' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
