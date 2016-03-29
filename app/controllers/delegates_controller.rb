class DelegatesController < ApplicationController
  def index
    @message = Message.new.with_delegates(:inslee)
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      SendMessageJob.perform_later(@message, "Delegates::WA::Inslee")

      redirect_to :success
    else
      flash.now[:error] = @message.errors.full_messages.join(', ')
      render :index
    end
  end

  def success
  end

  private

  def message_params
    params.require(:message).permit \
      :first_name,
      :last_name,
      :address1,
      :address2,
      :city,
      :zip,
      :email,
      :phone,
      :contents
  end
end
