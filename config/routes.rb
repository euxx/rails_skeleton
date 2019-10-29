require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#home'

  resource :page, only: [] do
    collection do
      get :home
    end
  end

  get    'sign_in'  => 'user_sessions#new'
  delete 'sign_out' => 'user_sessions#destroy'

  resources :user_sessions, only: :create

  mount Sidekiq::Web => '/sidekiq'
end
