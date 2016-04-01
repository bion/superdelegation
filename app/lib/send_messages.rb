class SendMessages
  def self.to_delegates(message)
    message.delegates.each do |delegate|
      SendMessageJob.perform_later(message, delegate.klass)
    end
  end
end
