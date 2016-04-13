require 'capybara/poltergeist'

if Rails.application.config.x.proxy.present?
  proxy_config = Rails.application.config.x.proxy

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new \
      app,
      phantomjs_options: [
        "--proxy=#{proxy_config.host}:#{proxy_config.port}",
        "--proxy-auth=#{proxy_config.username}:#{proxy_config.password}"
      ]
  end
end
