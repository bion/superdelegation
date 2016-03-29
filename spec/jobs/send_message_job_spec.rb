require 'rails_helper'

describe SendMessageJob do
  describe '#perform' do
    it "should make a new instance of the recipient_klass and send the message" do
      message = instance_double("Message")
      recipient = instance_double("Delegates::WA::Inslee")

      allow(Delegates::WA::Inslee).to receive(:new)
        .with(message)
        .and_return(recipient)

      allow(recipient).to receive(:deliver)

      subject.perform(message, "Delegates::WA::Inslee")

      expect(recipient).to have_received(:deliver)
    end
  end
end
