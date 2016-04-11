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
        h4 "Your message was sent to the following delegates:"
      end

      ul { delegate_list }
    end

    full_row do
      h4 "What can I do next?"

      p <<-EOF
        Bernie is relying on grassroots organization to spread his message. We
        cannot win without you! Here's how you can help:
      EOF

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
      h5 do
        strong "Help get out the vote"
      end

      p do
        text <<-EOF
          Reaching out to voters directly is what turns a 30 point deficit in
          the polls into a political upset. We've seen this time and time again
          over the course of the 2016 primaries. Canvassing in your
          neighborhood, phonebanking, texting, Facebanking are effective and
          easy tools at your disposal to instantly multiply your contribution
          to the campaign. Why stop at your own vote when you can convince 10,
          100, or 1000 more people to Feel the Bern? There is work to be done
          for even the most phone-shy:
        EOF
      end

      ul do
        li do
          link_to "Facebank for upcoming primaries",
            "http://feelthebern.events",
            target: "_blank"
        end

        li do
          link_to "Send texts for Bernie",
            "http://textforbernie.com",
            target: "_blank"
        end

        li do
          link_to "Phonebank for Bernie",
            "http://bernie.to/pb",
            target: "_blank"
        end

        li do
          link_to "Extra fun: Track your phonebanking stats and compete with your friends!",
            "http://berniepb.com",
            target: "_blank"
        end

        li do
          link_to "Find local Bernie events near you",
            "http://bernie.to/map",
            target: "_blank"
        end

        li do
          link_to "Drop into your local campaign office",
            "http://bernie.to/map",
            target: "_blank"
        end

        li do
          link_to "Explore dozens of other volunteer resources at bernkit.com",
            "http://www.bernkit.com",
            target: "_blank"
        end
      end
    end

    full_row do
      link_to(root_path) do
        img(src: "http://i.imgur.com/vM4Kr5M.jpg")
      end
    end
  end

  private

  def twitter_share_href
    "http://twitter.com/intent/tweet?text=#{social_media_cta}&url=#{root_url}"
  end

  def fb_share_button
    div class: 'fb-share-button success',
      "data-href" => state_url(state),
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
    "Voters of #{state}! Encourage your representatives to " +
      "support @BernieSanders with the click of one button using"
  end
end
