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
    :zip_extension,
    :email,
    :phone,
    :contents,
    presence: true

  validates :phone, length: { is: 10 }

  validates_numericality_of :zip, integer: true
  validates_length_of :zip, is: 5

  validates_numericality_of :zip_extension, integer: true
  validates_length_of :zip_extension, is: 4

  validates :email, format: { with: /.+@.+\..+/ }

  before_validation :format_phone_number

  enum honorific: {
    'Ms.' => 0,
    'Mrs.' => 1,
    'Mr.' => 2,
    'Dr.' => 3
  }

  private

  def format_phone_number
    return unless phone.present?

    self.phone = self.phone.gsub(/[^0-9]/, '')
  end
end
