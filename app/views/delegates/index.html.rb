class Views::Delegates::Index < Views::Base
  needs :message, :delegates

  def content
    full_row do
      h2 "Bernie Superdelegation"
      h4 "Tell your superdelegates to respect your vote"
    end

    full_row(class: 'description') do
      p <<-TEXT
Now that Bernie has won Washington by a landslide, it's important we
pressure our superdelegates to back him as well. Superdelegates
represent approximately 10,000 votes worth of power, so it's well
worth the time. Superdelegation allows you to easily send the same
message to the superdelegates in your state.
TEXT
    end

    error_messages

    form_for :message, url: delegates_path(params[:state]), method: :post do |f|
      delegate_inputs(f)
      message_fields(f)
      full_row { f.submit "Send Message", class: 'button' }
    end
  end

  private

  def message_fields(f)
    full_row do
      f.label :contents do
        text 'Your Message'
        f.text_area :contents, rows: 6
      end
    end

    full_row do
      f.label :first_name do
        text 'First Name'
        f.text_field :first_name
      end
    end

    full_row do
      f.label :last_name do
        text 'Last Name'
        f.text_field :last_name
      end
    end

    full_row do
      f.label :address1 do
        text 'Address Line 1'
        f.text_field :address1
      end
    end

    full_row do
      f.label :address2 do
        text 'Address Line 2'
        f.text_field :address2
      end
    end

    [
      :city,
      :zip,
      :email,
      :phone
    ].each do |attr|
      full_row do
        f.label attr do
          text attr.to_s.titleize
          f.text_field attr
        end
      end
    end
  end

  def delegate_inputs(f)
    delegates.each do |delegate|
      delegate_switch(f, delegate)
    end
  end

  def delegate_switch(f, delegate, checked = true)
    delegate_title = delegate.name.titleize
    el_name = "message[delegate_ids][]"
    checked = message.delegates.empty? ?
      true :
      message.delegates.include?(delegate)

    full_row do
      p "Send to #{delegate.position.titleize} #{delegate_title}"

      div(class: "switch large") do
        check_box_tag el_name,
          delegate.id,
          checked,
          class: "switch-input",
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
