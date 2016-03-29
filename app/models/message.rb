class Message < ActiveRecord::Base
  validates :first_name,
    :last_name,
    :address1,
    :city,
    :zip,
    :email,
    :phone,
    :contents,
    presence: true

  validates :phone, length: { is: 10 }

  before_validation :format_phone_number
  before_validation :ensure_state_is_capitalized

  private

  def ensure_state_is_capitalized
    return unless state.present?

    self.state = self.state.upcase
  end

  def format_phone_number
    return unless phone.present?

    self.phone = self.phone.gsub(/[^0-9]/, '')
  end
end
