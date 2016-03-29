class Message < ActiveRecord::Base
  attr_accessor :include_inslee

  validates :first_name,
    :last_name,
    :address1,
    :city,
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
end
