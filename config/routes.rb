Rails.application.routes.draw do
  root 'landing#index'

  scope ':state' do
    resources :delegates, only: %i[index create]
  end

  get 'success', to: 'delegates#success'
end
