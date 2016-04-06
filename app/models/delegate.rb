class Delegate < ActiveRecord::Base
  include StateModelConcern

  validates :state,
    :name,
    :position,
    :klass,
    presence: true

  has_many :delegate_messages
  has_many :messages, through: :delegate_messages

  def is_rep?
    position == 'Representative'
  end
end
