require 'rails_helper'

describe Delegates::WA::Larsen do
  let(:message) do
    instance_double "Message",
      first_name: "Jeff",
      last_name: "Johnson",
      address1: "3022 Elizabeth St",
      address2: "Apt 8",
      city: "Bellingham",
      zip: "98225",
      zip_extension: "1616",
      email: "jeffjohnson@example.com",
      phone: "3601234567",
      contents: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "\
        "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  end

  subject { described_class.new(message) }

  describe '#deliver!' do
    it "should send a message to Rick Larsen" do
      VCR.use_cassette("delegates/wa/larsen_success") do
        expect(subject.deliver!).to eq(nil)
      end
    end

    it "should handle failure by raising an error" do
      VCR.use_cassette("delegates/wa/larsen_failure") do
        allow(message).to receive(:city) { "" }

        expect {
          subject.deliver!
        }.to raise_error(Delegates::SubmissionError)
      end
    end
  end
end
