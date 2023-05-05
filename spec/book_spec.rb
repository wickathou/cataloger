require_relative 'spec_utils'

describe Book do

  
  let(:genre) {double('genre', items: [])}
  let(:label) {double('label', items: [])}
  let(:author) {double('author', items: [])}
  let(:book) {Book.new([genre], [author], [label])}

  before do
    allow_any_instance_of(Book).to receive(:instance_selector).and_return(genre, author, label)
  end
  
  context 'when initialized' do
    before do
      allow_any_instance_of(Book).to receive(:cover_state).and_return('good')
      allow_any_instance_of(Book).to receive(:publisher).and_return('publisher')
      allow_any_instance_of(Book).to receive(:publish_date_input).and_return(2010)
    end

    it 'shows information about the Book' do
      expect(book.genre).to eq genre
      expect(book.author).to eq author
      expect(book.label).to eq label
      expect(book.publish_date).to eq 2010
      expect(book.cover_state).to eq 'good'
      expect(book.publisher).to eq 'publisher'
    end
    it 'can be archived' do
      book.move_to_archive
      expect(book.archived).to eq true
    end
  end

  context 'when initialized' do
    before do
      allow_any_instance_of(Book).to receive(:cover_state).and_return('good')
      allow_any_instance_of(Book).to receive(:publisher).and_return('publisher')
      allow_any_instance_of(Book).to receive(:publish_date_input).and_return(2015)
    end

    it 'cannot be archived' do
      book.move_to_archive
      expect(book.archived).to eq false
    end
  end
end
