require_relative 'spec_utils'

describe Label do
  let(:label) {Label.new}
  before do
    allow_any_instance_of(Label).to receive(:text_input).and_return('Label title', 'Label color')
  end
  context 'when initialized' do
    
    it 'has a first name and last name' do
      expect(label.id.length).to eq(36)
      expect(label.title).to eq('Label title')
      expect(label.color).to eq('Label color')
    end
  end

  context 'when adding an item' do
    
    let(:item) {double('item', label: nil)}
    before do
      allow(item).to receive(:label=).with(label).and_return(label)
    end
    
    it 'adds the item to the label' do
      label.add_item(item)
      expect(label.items).to include(item)
    end
  end
end
