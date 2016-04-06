require 'rails_helper'

describe Delegate do
  describe '#is_rep?' do
    it 'returns true if the delegate is a representative' do
      subject.position = 'Representative'
      expect(subject.is_rep?).to be true
    end

    it 'returns false if the delegate is not a representative' do
      subject.position = 'Commodore'
      expect(subject.is_rep?).to be false
    end
  end
end
