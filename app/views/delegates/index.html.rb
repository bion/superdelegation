class Views::Delegates::Index < Views::Base
  needs :message

  def content
    error_messages

    full_row do
      h2 "Let 'em know"
    end

    form_for message, url: delegates_path, method: :post do |f|
      [
        :first_name,
        :last_name,
        :address1,
        :address2,
        :city,
        :zip,
        :email,
        :phone
      ].each do |attr|
        row do
          column do
            f.label attr
            f.text_field attr
          end
        end
      end

      full_row do
        f.label :contents
        f.text_area :contents
      end

      full_row { f.submit "Send Message", class: 'button' }
    end
  end

  private

  def error_messages
    if flash[:error]
      full_row do
        div class: 'error' do
          text(flash[:error])
        end
      end
    end
  end
end
