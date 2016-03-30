class DelegatesController < ApplicationController
  Delegate = Struct.new :name, :position, :klass

  def index
    set_delegates_for_state
    @message = Message.new
  end

  def create
    set_delegates_from_params
    @message = Message.new(message_params)

    if @message.save
      SendMessages.to_delegates(@message, delegates)

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
      :contents
    ).merge(state: state)
  end

  def delegates
    return @delegates if @delegates
    raise 'Delegates unset'
  end

  def set_delegates_from_params
    @delegates = delegates_manifest[state]
      .select { |d| delegate_names_from_params.include? d['name'] }
      .map { |d| delegate_from_h(d) }
  end

  def delegate_names_from_params
    params
      .require(:message)
      .require(:delegates)
      .select { |k, v| v == "1" }
      .keys
  end

  def set_delegates_for_state
    @delegates = delegates_manifest[state].map { |d| delegate_from_h(d) }
  end

  def delegates_manifest
    @delegates_manifest ||= JSON.parse(File.read("config/delegates.json"))
  end

  def state
    params[:state].upcase
  end

  def delegate_from_h(hash)
    Delegate.new(*hash.with_indifferent_access.values_at(*Delegate.members))
  end
end
