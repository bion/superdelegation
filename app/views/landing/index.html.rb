class Views::Landing::Index < Views::Base
  needs :states

  def content
    full_row do
      h1 "Superdelegation"

      p <<-EOF
        This site makes it easy for you to contact your state superdelegates and
        encourage them to support Senator Sanders in states that went for Bernie.
      EOF

      p do
        text "To get started, select your state from the list of supported states "\
          "below. Don't see your state? Help us add it on "

        link_to "GitHub", "https://github.com/bionhart/superdelegation", target: "_blank"

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
            link_to full_name, delegates_path(state_code)
          end
        end
      end
    end
  end
end
