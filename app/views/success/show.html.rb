class Views::Success::Show < Views::Base
  def content
    full_row do
      div(class: "title text-center") do
        h1 "Your message was successfully sent to:"
        ul do
          delegate_list
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
