Rails.application.routes.draw do
  root 'delegates#index'

  resources :delegates, only: %i[index create]

  get 'success', to: 'delegates#success'
  get '/:state', to: 'delegates#index', as: :state
end
