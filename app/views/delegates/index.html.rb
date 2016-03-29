class Views::Delegates::Index < Views::Base
  needs :message

  def content
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

      full_row { f.submit class: 'button' }
    end
  end
end
