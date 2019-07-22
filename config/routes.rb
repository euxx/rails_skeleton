Rails.application.routes.draw do
  root 'pages#home'

  resource :page do
    collection do
      get :home
    end
  end
end
