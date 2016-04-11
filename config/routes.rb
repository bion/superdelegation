Rails.application.routes.draw do
  root 'landing#index'

  get 'privacy', to: 'landing#privacy'
  get ':state', to: 'delegates#index', as: 'state'

  match '/admin/delayed_job' => DelayedJobWeb,
    anchor: false,
    via: [:get, :post]

  scope ':state' do
    resources :delegates, only: [:create]
    get 'success', to: 'success#show'
  end
end
