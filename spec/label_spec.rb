require_relative 'spec_utils'

require './label'

describe Label do
  context 'create a book' do
    label = Label.new('things fall apart', 'blue')

    it 'return name of the book' do
      expect(label.title).to eq('things fall apart')
    end

    it 'return the state of the book' do
      expect(label.color).to eq('blue')
    end
  end
end
