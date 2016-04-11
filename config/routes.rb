Rails.application.routes.draw do
  root 'landing#index'
  get 'privacy', to: 'landing#privacy'
  get ':state', to: 'delegates#index', as: 'state'

  scope ':state' do
    resources :delegates, only: [:create]
    get 'success', to: 'success#show'
  end
end
