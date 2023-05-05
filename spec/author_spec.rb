require_relative 'spec_utils'

describe Author do
  let(:author) {Author.new}
  before do
    allow_any_instance_of(Author).to receive(:text_input).and_return('Firstname', 'Lastname')
  end
  context 'when initialized' do
    
    it 'has a first name and last name' do
      expect(author.id.length).to eq(36)
      expect(author.first_name).to eq('Firstname')
      expect(author.last_name).to eq('Lastname')
    end
  end

  context 'when adding an item' do
    
    let(:item) {double('item', author: nil)}
    before do
      allow(item).to receive(:author=).with(author).and_return(author)
    end
    
    it 'adds the item to the author' do
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end
