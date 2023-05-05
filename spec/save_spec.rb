require_relative 'spec_utils'

describe 'Save decorators' do
  # let(:item) {instance_double(Item, author: author, genre: genre, label: label, publish_date: 2010, archived: false, id: '123456789123456789123456789123456789')}
  let(:generic_item) {instance_double(Item, id: '123456789123456789123456789123456789')}
  let(:genre) {instance_double(Genre, items: [generic_item], id: '123456789123456789123456789123456789', name: 'genre')}
  let(:label) {instance_double(Label, items: [generic_item], id: '123456789123456789123456789123456789', title: 'label', color: 'red')}
  let(:author) {instance_double(Author, items: [generic_item], id: '123456789123456789123456789123456789', first_name: 'John', last_name: 'Doe')}

  let(:game) {instance_double(Game, author: author, genre: genre, label: label, publish_date: 2010, archived: false, id: '123456789123456789123456789123456789')}
  let(:music) {instance_double(MusicAlbum, author: author, genre: genre, label: label, publish_date: 2010, archived: false, id: '123456789123456789123456789123456789')}
  let(:book) {instance_double(Book, author: author, genre: genre, label: label, publish_date: 2010, archived: false, id: '123456789123456789123456789123456789')}

  let(:items) {[game, music, book]}

  let(:save_items) {SaveItemDecorator.new(items)}
  before do
    allow_any_instance_of(SaveItemDecorator).to receive(:class_properties_generator).with(game).and_return({multiplayer: true, last_played_date: 2020})
    allow_any_instance_of(SaveItemDecorator).to receive(:class_properties_generator).with(music).and_return({on_spotify: true})
    allow_any_instance_of(SaveItemDecorator).to receive(:class_properties_generator).with(book).and_return({publisher: 'Penguin', cover_state: 'Good'})
  end

  it 'creates a SaveItemDecorator' do

    SaveItemDecorator.new(items).save_routine
    expect(File.exist?('./data/items.json')).to be true
  end
end