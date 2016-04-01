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
end
