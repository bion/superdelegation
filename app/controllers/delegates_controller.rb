class DelegatesController < ApplicationController
  def index
    @message = Message.new

    Delegate.where(state: state).each do |delegate|
      @message.delegate_messages.build(delegate: delegate, selected: true)
    end
  end

  def create
    @message = Message.new(message_params)
    @delegates = @message.delegates

    if @message.save
      SendMessages.to_delegates(@message)

      redirect_to :success
    else
      flash.now[:error] = @message.errors.full_messages
      render :index
    end
  end

  def success
  end

  private

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
      delegate_messages_attributes: [:delegate_id, :selected]
    ).merge(state: state)
  end

  def state
    params[:state].upcase
  end
end
