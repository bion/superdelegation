class Views::Delegates::Index < Views::Base
  needs :message, :delegates

  def content
    full_row do
      h2 "Bernie Superdelegation"
      h4 "Call to action"
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
    name = delegate.name

    full_row do
      p "Send to #{delegate.position.titleize} #{name.titleize}"

      div(class: "switch large") do
        f.check_box "delegates[#{name}]",
          class: "switch-input",
          id: "delegates-#{name}",
          checked: checked

        label(class: "switch-paddle", for: "#{name}-switch") do
          span(class: "show-for-sr") do
            text("Send to #{name.titleize}?")
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

    flash[:error].each do |error|
      full_row { div(class: 'error') { text(error) } }
    end
  end
end
