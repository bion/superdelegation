Rails.application.routes.draw do
  resources :delegates, only: %i[index create]
  get 'success', to: 'delegates#success'

  root 'delegates#index'
end
