class Views::Success::Show < Views::Base
  needs :delegates

  def content
    full_row do
      h2(class: "title") { text "Bernie Superdelegation" }
    end


    if delegates.empty?
      full_row do
        h4 "Your message was sent."
      end
    else
      full_row do
        h4 "Your message was sent to the following representatives:"
      end

      ul { delegate_list }
    end

    full_row do
      a(target: "_blank",
        href: "http://twitter.com/home?status=#{social_media_cta}") do

        text "Tweet Superdelegation to you followers!"
      end
    end

    full_row do
      img(src: "http://i.imgur.com/vM4Kr5M.jpg")
    end
  end

  private

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
    "Voters of #{params[:state]}! Encourage your representatives to " +
      "support Bernie Sanders with the click of one button using #{root_url}"
  end
end
