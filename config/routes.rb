Rails.application.routes.draw do
  root 'landing#index'
  get ':state', to: 'delegates#index', as: 'state'

  scope ':state' do
    resources :delegates, only: [:create]
    get 'success', to: 'delegates#success'
  end
end
