class States
  SUPPORTED_STATES = {
    "WA" => "Washington"
  }.freeze

  def self.supported
    SUPPORTED_STATES
  end
end
