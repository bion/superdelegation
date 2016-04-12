class SuccessController < ApplicationController
  def show
    @state = States.with_code(params[:state])
    @delegates = session[:delegates] || []
  end
end
