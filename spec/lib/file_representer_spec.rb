require 'rails_helper'

describe FileRepresenter do
  let(:rows) {
    [
      ['Test', 'Subject', 'test@subject.com', 'boat', 'tuggy', '24ft'],
      ['Another', 'Friend', 'another@subject.com', 'rv', 'hank', '32ft'],
    ]
  }

  subject { described_class.new rows }

  describe '#header' do
    it 'returns the correct headers' do
      expect(subject.header).to eq described_class::HEADER
    end
  end

  describe '#rows' do
    it 'returns the rows with the first and last names combined' do
      expect(subject.rows).to eq( [
         ['Test Subject', 'test@subject.com', 'boat', 'tuggy', '24ft'],
         ['Another Friend', 'another@subject.com', 'rv', 'hank', '32ft'],
      ] )
    end
  end
end
