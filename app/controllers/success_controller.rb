class SuccessController < ApplicationController
  def show
    @state = States.with_code(params[:state].try(:upcase))
    @delegates = session[:delegates] || []
  end
end
