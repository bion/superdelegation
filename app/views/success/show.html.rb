class Views::Success::Show < Views::Base
  needs :delegates, :state

  def content
    full_row do
      h2(class: "title") { text "Superdelegation" }
    end

    if delegates.empty?
      full_row do
        h4 "Your message was sent."
      end
    else
      full_row do
        h4 "Your message was sent to the following elected officials:"
      end

      ul { delegate_list }
    end

    full_row do
      h4 "What can I do next?"

      h5 do
        strong "Share this website"
      end
    end

    full_row do
      a(class: 'twitter-share-button', href: twitter_share_href) do
        text "Tweet to your followers"
      end
    end

    full_row do
      fb_share_button
    end

    full_row do
      p do
        text "Direct share link for #{state.name}: "
        link_to state_url(state.code), state_url(state.code)
        br
        text "Direct share link for other states: "
        link_to root_url, root_url
      end
    end
  end

  private

  def twitter_share_href
    "http://twitter.com/intent/tweet?text=#{social_media_cta}&url=#{root_url}"
  end

  def fb_share_button
    div class: 'fb-share-button success',
      "data-href" => root_url,
      "data-layout" => "button_count"
  end

  def delegate_list
    delegates.each do |delegate|
      delegate_list_item(delegate)
    end
  end

  def delegate_list_item(delegate)
    position = delegate["position"].titleize
    name = delegate["name"].titleize

    full_row do
      li "#{position} #{name}"
    end
  end

  def social_media_cta
    "Residents of #{state.code}! Contact your elected officals" +
    "with the click of one button using superdelegation.com"
  end
end
