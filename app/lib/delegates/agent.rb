module Delegates::Agent
  def agent
    Mechanize.new.tap(&method(:configure))
  end

  def configure(agent)
    return unless Rails.env.production?

    agent.set_proxy(*proxy_args)
    agent.user_agent_alias = (Mechanize::AGENT_ALIASES.keys - ['Mechanize']).sample
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
