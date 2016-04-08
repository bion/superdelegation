require 'rails_helper'

describe Delegates::WA::Cantwell, :live_test do
  let(:message) do
    instance_double "Message",
      first_name: "Thomas",
      last_name: "Shelby",
      address1: "121 Fir St",
      address2: "",
      city: "Enumclaw",
      zip: "98022",
      email: "thommy22@yahoo.com",
      phone: "2061345672",
      contents: "Washington state needs fewer missile silos!"
  end

  subject { described_class.new(message) }

  describe '#deliver!' do
    it "should send a message to Maria Cantwell" do
      expect(subject.deliver!).to eq(nil)
    end

    it "should handle failure by raising an error" do
      allow(message).to receive(:city) { "" }

      expect {
        subject.deliver!
      }.to raise_error(Delegates::SubmissionError)
    end
  end
end
