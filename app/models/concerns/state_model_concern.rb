module StateModelConcern
  extend ActiveSupport::Concern

  included do
    before_validation :ensure_state_is_capitalized
  end

  def ensure_state_is_upcased
    return unless state.present?

    self.state = self.state.upcase
  end
end
