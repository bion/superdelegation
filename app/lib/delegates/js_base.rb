class Delegates::JSBase
  include Capybara::DSL

  attr_reader :message

  def initialize(message)
    @message = message
    configure_capybara
  end

  def deliver!
    raise NotImplementedError
  end

  protected

  def host
    raise NotImplementedError
  end

  def configure_capybara
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :selenium
      config.app = ""
      config.app_host = host
    end
  end
end
