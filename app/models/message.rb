class Message < ActiveRecord::Base
  include StateModelConcern

  has_many :delegate_messages
  has_many :delegates, through: :delegate_messages
  accepts_nested_attributes_for :delegate_messages

  validates :first_name,
    :last_name,
    :address1,
    :city,
    :state,
    :zip,
    :email,
    :phone,
    :contents,
    presence: true

  validates :phone, length: { is: 10 }

  before_validation :format_phone_number

  private

  def format_phone_number
    return unless phone.present?

    self.phone = self.phone.gsub(/[^0-9]/, '')
  end
end
