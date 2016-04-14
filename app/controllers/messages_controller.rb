class MessagesController < ApplicationController
  before_action :redirect_unless_state_code
  before_action :state

  def index
    @message = Message.new
    expose_delegates
  end

  def create
    @message = Message.new(message_params)

    if verify_recaptcha(model: @message) && @message.save
      SendMessages.to_delegates(@message)

      session[:delegates] = @message.delegates
      redirect_to success_path(state_code)
    else
      expose_delegates
      flash.now[:error] = @message.errors.full_messages
      render :index
    end
  end

  private

  def expose_delegates
    @delegates ||= Delegate.where(state: state_code)
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
      :zip_extension,
      :email,
      :phone,
      :contents,
      :stay_up_to_date,
      :honorific,
      delegate_ids: []
    ).merge(state: state_code)
  end

  def state_code
    params[:state].upcase
  end

  def state
    @state ||= States.with_code(state_code)
  end

  def redirect_unless_state_code
    redirect_to root_path unless States.supported.include?(state_code)
  end
end
