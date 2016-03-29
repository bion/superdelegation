class Views::Delegates::Index < Views::Base
  needs :message

  Delegate = Struct.new :name, :title

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

    form_for message, url: delegates_path, method: :post do |f|
      delegate_inputs(f)
      message_fields(f)
      full_row { f.submit class: 'button' }
    end
  end

  private

  def message_fields(f)
    full_row do
      f.label :contents, "Your Message"
      f.text_area :contents, rows: 6
    end

    full_row do
      f.label :first_name
      f.text_field :first_name
    end

    full_row do
      f.label :last_name
      f.text_field :last_name
    end

    full_row do
      f.label 'Address Line 1'
      f.text_field :address1
    end

    full_row do
      f.label 'Address Line 2'
      f.text_field :address2
    end

    [
      :city,
      :zip,
      :email,
      :phone
    ].each do |attr|
      full_row do
        f.label attr
        f.text_field attr
      end
    end
  end

  def delegate_inputs(f)
    delegate_switch(f, Delegate.new("inslee", 'Governor'))
  end

  def delegate_switch(f, delegate)
    name = delegate.name

    full_row do
      p "Send to #{delegate.title} #{name.titleize}"

      div(class: "switch large") do
        f.check_box("include_#{name}", class: "switch-input", id: "#{name}-switch")

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
end
