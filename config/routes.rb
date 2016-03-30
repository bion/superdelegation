Rails.application.routes.draw do
  root 'delegates#index'

  scope ':state' do
    resources :delegates, only: %i[index create]
  end

  get 'success', to: 'delegates#success'
end
