class DelegatesController < ApplicationController
  def index
    @message = Message.new
    expose_delegates
  end

  def create
    @message = Message.new(message_params)

    if verify_recaptcha(model: @message) && @message.save
      SendMessages.to_delegates(@message)

      redirect_to :success
    else
      expose_delegates
      flash.now[:error] = @message.errors.full_messages
      render :index
    end
  end

  def success
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
end
