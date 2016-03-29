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
end
