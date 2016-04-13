module Delegates::Agent
  def agent
    Mechanize.new.tap(&method(:config_mechanize_proxy_if_needed))
  end

  def config_mechanize_proxy_if_needed(agent)
    agent.set_proxy(*proxy_args) if Rails.env.production?
  end

  def proxy_args
    [
      proxy_conf.host,
      proxy_conf.port,
      proxy_conf.username,
      proxy_conf.password
    ]
  end

  def proxy_conf
    Rails.application.config.x.proxy
  end
end
