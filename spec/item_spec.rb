require_relative 'spec_utils'

describe Item do
  let(:genre) { double('genre', items: []) }
  let(:label) { double('label', items: []) }
  let(:author) { double('author', items: []) }
  let(:item) { Item.new([genre], [author], [label]) }

  before do
    allow_any_instance_of(Item).to receive(:instance_selector).and_return(genre, author, label)
  end

  context 'when initialized' do
    before do
      allow_any_instance_of(Item).to receive(:publish_date_input).and_return(2010)
    end

    it 'shows information about the Item' do
      expect(item.genre).to eq genre
      expect(item.author).to eq author
      expect(item.label).to eq label
      expect(item.publish_date).to eq 2010
      expect(item.archived).to eq false
    end

    it 'can be archived' do
      item.move_to_archive
      expect(item.archived).to eq true
    end
  end

  context 'when initialized' do
    before do
      allow_any_instance_of(Item).to receive(:publish_date_input).and_return(2020)
    end

    it 'cannot be archived' do
      item.move_to_archive
      expect(item.archived).to eq false
    end
  end
end
