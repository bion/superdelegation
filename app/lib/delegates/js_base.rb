class Delegates::JSBase
  attr_reader :message
  attr_reader :session

  def initialize(message)
    @message = message
    @session = Capybara::Session.new(:poltergeist)
  end

  def deliver!
    raise NotImplementedError
  end

  protected

  def host
    raise NotImplementedError
  end
end
