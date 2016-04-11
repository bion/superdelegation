class LandingController < ApplicationController
  def index
    @states = States.supported
  end

  def privacy; end
end
