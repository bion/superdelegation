class Message < ActiveRecord::Base
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

  def with_delegates(*delegates)
    delegates = delegates.first if delegates.first.class == Array

    delegates.each do |delegate|
      self.define_singleton_method("include_#{delegate}") do
        instance_variable_get("@#{delegate}")
      end

      self.define_singleton_method("include_#{delegate}=") do |val|
        instance_variable_set("@#{delegate}", val)
      end
    end

    self
  end

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
