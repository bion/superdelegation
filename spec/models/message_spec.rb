require 'rails_helper'

describe Message do
  describe 'validations' do
    context "phone validation" do
      it 'should remove non-digit characters before validation' do
        subject.phone = "206-123-4567"
        subject.valid?

        expect(subject.phone).to eq("2061234567")
      end

      it 'should not blow up on nil' do
        subject.phone = nil

        expect { subject.valid? }.to_not raise_error
      end
    end

    context "state validation" do
      it "should always capitalize the state" do
        subject.state = "wa"
        subject.valid?

        expect(subject.state).to eq("WA")
      end

      it 'should not blow up on nil' do
        subject.state = nil

        expect { subject.valid? }.to_not raise_error
      end
    end

    context 'contents validation' do
      it "is valid if it's relevant" do
        subject.contents = "superdelegates"

        subject.valid?
        expect(subject.errors[:contents]).to be_empty
      end

      it "is invalid if it isn't relevant" do
        subject.contents = "hahah i'm a joke"

        subject.valid?
        expect(subject.errors[:contents]).to be_present
      end
    end

    context 'zip code validation' do
      it 'is valid if a 5-digit number' do
        subject.zip = '99999'

        subject.valid?
        expect(subject.errors[:zip]).to be_empty
      end

      it 'is invalid if not a number' do
        subject.zip = 'hahah'

        subject.valid?
        expect(subject.errors[:zip]).to be_present
      end

      it 'is invalid if it is not 5-digits' do
        subject.zip = '9999'

        subject.valid?
        expect(subject.errors[:zip]).to be_present
      end
    end

    context 'zip extension validation' do
      it 'is valid if a 4-digit number' do
        subject.zip_extension = '9999'

        subject.valid?
        expect(subject.errors[:zip_extension]).to be_empty
      end

      it 'is invalid if not a number' do
        subject.zip_extension = 'hahah'

        subject.valid?
        expect(subject.errors[:zip_extension]).to be_present
      end

      it 'is invalid if it is not 4-digits' do
        subject.zip_extension = '999'

        subject.valid?
        expect(subject.errors[:zip_extension]).to be_present
      end
    end
  end
end
