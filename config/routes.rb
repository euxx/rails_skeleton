require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  get    'sign_in'  => 'user_sessions#new'
  delete 'sign_out' => 'user_sessions#destroy'

  resources :user_sessions, only: :create

  mount Sidekiq::Web => '/sidekiq', constraints: AuthConstraint.new

  get '/404' => 'errors#not_found'
  get '/422' => 'errors#unprocessable_entity'
  get '/500' => 'errors#internal_server_error'
end
