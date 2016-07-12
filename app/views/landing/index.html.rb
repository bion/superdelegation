class Views::Landing::Index < Views::Base
  needs :states

  def content
    full_row do
      h1 "Superdelegation"

      h4 "Send the same message to multiple elected officials that represent you by filling out just one form."
      p "Select your state from the list below to get started."

      p do
        text "Don't see your state? Help us add it on "
        link_to "GitHub", "https://github.com/bion/superdelegation", target: "_blank"

        text " or bother "

        link_to "@dbalatero", "https://twitter.com/dbalatero", target: "_blank"

        text " and "

        link_to "@bionhart", "https://twitter.com/bionhart", target: "_blank"

        text " on Twitter."
      end

      h3 "Pick Your State"

      ul do
        states.sort.to_h.each do |state_code, full_name|
          li do
            link_to full_name, state_path(state_code)
          end
        end
      end

      footer do
        link_to "Privacy Policy", privacy_path
      end
    end
  end
end
