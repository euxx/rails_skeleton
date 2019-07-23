Rails.application.routes.draw do
  root 'pages#home'

  resource :page do
    collection do
      get :home
    end
  end

  get    'sign_up'  => 'users#new'
  get    'sign_in'  => 'user_sessions#new'
  delete 'sign_out' => 'user_sessions#destroy'

  resources :users, only: :create
  resources :user_sessions, only: :create
end
