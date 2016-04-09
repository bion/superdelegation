class Views::Delegates::Index < Views::Base
  needs :message, :delegates, :state

  def content
    full_row_left do
      h2 "Superdelegation"
      h4 "Tell your superdelegates to respect your vote"
    end

    full_row_left do
      p <<-TEXT
        Now that Bernie has won #{state.name}, it's important we
        pressure our superdelegates to back him as well. Superdelegates
        represent approximately 10,000 votes worth of power, so it's well
        worth the time. Superdelegation allows you to easily send the same
        message to the superdelegates in your state.
      TEXT
    end

    error_messages

    form_for :message, url: delegates_path(params[:state]), method: :post do |f|
      div(class: 'columns large-6') do
        full_row_left do
          h4 "Statewide Delegates"
        end

        other_delegate_inputs(f)

        full_row_left do
          h4(class: "rep-header") { text "Representatives" }
          p do
            text "House Representatives only accept messages from people in their districts. "
            link_to 'Find your rep',
              'http://www.house.gov/representatives/find/',
              target: '_blank'
          end
        end

        representative_inputs(f)
      end

      div(class: 'columns large-6') do
        message_fields(f)

        full_row_left(classes: %w[recaptcha-container]) do
          text recaptcha_tags(stoken: false)
        end

        full_row_left { f.submit "Send Message", class: 'button' }
      end
    end
  end

  private

  def message_fields(f)
    full_row_left do
      f.label :contents do
        text 'Your Message'
        f.text_area :contents, rows: 6
      end
    end

    full_row_left do
      f.label :first_name do
        text 'First Name'
        f.text_field :first_name
      end
    end

    full_row_left do
      f.label :last_name do
        text 'Last Name'
        f.text_field :last_name
      end
    end

    full_row_left do
      f.label :address1 do
        text 'Address Line 1'
        f.text_field :address1
      end
    end

    full_row_left do
      f.label :address2 do
        text 'Address Line 2'
        f.text_field :address2
      end
    end

    field_in_row(f, :city)
    field_in_row(f, :zip)

    zip_finder_link = capture do
      link_to 'find it here',
        'https://tools.usps.com/go/ZipLookupAction_input',
        target: '__blank'
    end

    field_in_row f,
      :zip_extension,
      <<-MSG
        +4 Zip Extension (required for contacting some officials, #{zip_finder_link})
      MSG
    .html_safe

    field_in_row(f, :email)
    field_in_row(f, :phone)
  end

  def field_in_row(f, attr, label_text = nil)
    full_row_left do
      f.label attr do
        text label_text || attr.to_s.titleize
        f.text_field attr
      end
    end
  end

  def representative_inputs(f)
    delegates.select(&:is_rep?).each do |rep|
      checked = message.delegates.empty? ?
        false :
        message.delegates.include?(rep)

      delegate_switch(f, rep, checked)
    end
  end

  def other_delegate_inputs(f)
    delegates.reject(&:is_rep?).each do |delegate|
      checked = message.delegates.empty? ?
        true :
        message.delegates.include?(delegate)

      delegate_switch(f, delegate, checked)
    end
  end

  def delegate_switch(f, delegate, checked)
    delegate_title = delegate.name.titleize
    el_name = "message[delegate_ids][]"

    full_row_left do
      p(class: "delegate-name") do
        text "Send to #{delegate.position.titleize} #{delegate_title}"
      end

      div(class: "switch large") do
        classes = ["switch-input"]
        classes << "representative" if delegate.is_rep?

        check_box_tag el_name,
          delegate.id,
          checked,
          class: classes,
          id: "message_delegates_#{delegate.id}"

        label(class: "switch-paddle", for: "message_delegates_#{delegate.id}") do
          span(class: "show-for-sr") do
            text("Send to #{delegate_title}?")
          end

          span(class: "switch-active", "aria-hidden" => true) do
            text("Yes")
          end

          span(class: "switch-inactive", "aria-hidden" => true) do
            text("No")
          end
        end
      end
    end
  end

  private

  def error_messages
    return unless flash[:error]

    full_row(class: 'error-container') do
      div(class: 'callout alert') do
        h5 "There were errors in your form"

        ul do
          flash[:error].each do |error|
            li(error)
          end
        end
      end
    end
  end
end
