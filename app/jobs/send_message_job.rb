class SendMessageJob < ActiveJob::Base
  queue_as :default

  # Public: takes a Message and a recipient class, e.g.
  #
  # SendMessageJob.new.perform(Message.first, "Delegates::WA::Inslee")
  def perform(message, recipient_klass)
    recipient_klass
      .to_s
      .constantize
      .new(message)
      .deliver!
  end
end
