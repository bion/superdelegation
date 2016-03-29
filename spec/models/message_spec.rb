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
  end
end
