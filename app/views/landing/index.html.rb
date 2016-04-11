class Views::Landing::Index < Views::Base
  needs :states

  def content
    full_row do
      h1 "Superdelegation"
      h4 "Tell your superdelegates to respect your vote"

      p "Bernie Sanders has won the popular support of democrats in
        many states whose superdelegates are pledged to Hillary
        Clinton. Superdelegates represent approximately 10,000 people
        worth of voting power, which makes them an undemocratic force
        in favor of Clinton's candidacy."
      p "This site allows you to send the same message to all of the
        superdelegates that represent you by filling out just one form
        so you can urge them to pledge their vote to the candidate you
        and the majority of democrats in your state support."
      p "Select your state from the list below to contact your superdelegates."

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
