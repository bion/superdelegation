class SendMessages
  def self.to_delegates(message)
    delegates = config[message.state]

    delegates.each do |delegate|
      SendMessageJob.perform_later(message, delegate["klass"])
    end
  end

  def self.config
    @config ||= JSON.parse(File.read("config/delegates.json"))
  end
end
