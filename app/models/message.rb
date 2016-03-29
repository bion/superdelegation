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

  before_validation :format_phone_number

  private

  def format_phone_number
    return unless phone.present?

    self.phone = self.phone.gsub(/[^0-9]/, '')
  end
end
