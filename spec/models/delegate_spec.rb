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

  describe 'validations' do
    describe 'position' do
      it 'is valid if it is included in the list' do
        subject.position = 'Governor'
        subject.valid?
        expect(subject.errors[:position]).to be_empty
      end

      it 'is not valid if not included in the list' do
        subject.position = 'Commodore'
        subject.valid?
        expect(subject.errors[:position]).to_not be_empty
      end
    end
  end
end
