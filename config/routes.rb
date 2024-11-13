Rails.application.routes.draw do
  mount MissionControl::Jobs::Engine, at: '/jobs'

  root 'pages#home'

  get    'sign_in'  => 'sessions#new'
  delete 'sign_out' => 'sessions#destroy'

  resources :sessions, only: [:new, :create]
  resources :passwords, param: :token

  get '/404' => 'errors#not_found'
  get '/422' => 'errors#unprocessable_entity'
  get '/500' => 'errors#internal_server_error'
end
