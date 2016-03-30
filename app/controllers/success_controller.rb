class SuccessController < ApplicationController
  def show
    @delegates = session[:delegates]
  end
end
