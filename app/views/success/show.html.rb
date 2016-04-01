class Views::Success::Show < Views::Base
  needs :delegates

  def content
    full_row do
      div do
        h1(class: "title text-center") { text "Success!" }

        if delegates.empty?
          h4 "Your message was sent."
        else
          h4 "Your message was sent to the following representatives:"
          ul { delegate_list }
        end

        a(target: "_blank",
          href: "http://twitter.com/home?status=#{social_media_cta}") do

          text "Tweet this!"
        end
      end
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

    li "#{position} #{name}"
  end

  def social_media_cta
    "Voters of #{params[:state]}! Encourage your representatives to " +
    "support Bernie Sanders with the click of one button with #{root_url}."
  end
end
