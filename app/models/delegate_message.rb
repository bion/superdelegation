class DelegateMessage < ActiveRecord::Base
  belongs_to :message
  belongs_to :delegate

  validates :message_id,
    :delegate_id,
    presence: true

  validates :selected,
    inclusion: { in: [true, false] }

  delegate :name, to: :delegate, prefix: true
end
