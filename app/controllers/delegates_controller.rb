class DelegatesController < ApplicationController
  before_action :redirect_unless_state

  def index
    @message = Message.new
    expose_delegates
  end

  def create
    @message = Message.new(message_params)

    if verify_recaptcha(model: @message) && @message.save
      SendMessages.to_delegates(@message)

      session[:delegates] = delegates
      redirect_to success_path
    else
      expose_delegates
      flash.now[:error] = @message.errors.full_messages
      render :index
    end
  end

  private

  def expose_delegates
    @delegates ||= Delegate.where(state: state)
  end

  def message_params
    params.require(:message).permit(
      :first_name,
      :last_name,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :email,
      :phone,
      :contents,
      delegate_ids: []
    ).merge(state: state)
  end

  def state
    params[:state].upcase
  end

  def redirect_unless_state
    redirect_to root_path unless States.supported.include?(state)
  end
end
