class Delegate < ActiveRecord::Base
  include StateModelConcern

  validates :state,
    :name,
    :position,
    :klass,
    presence: true

  VALID_POSITIONS = %w[
    Governor
    Senator
    Representative
  ]

  validates :position, inclusion: { in: VALID_POSITIONS }

  has_many :delegate_messages
  has_many :messages, through: :delegate_messages

  def is_rep?
    position == 'Representative'
  end
end
