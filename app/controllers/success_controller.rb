class SuccessController < ApplicationController
  def show
    @state = params[:state]
    @delegates = session[:delegates] || []
  end
end
