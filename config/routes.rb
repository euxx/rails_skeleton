Rails.application.routes.draw do
  root 'pages#home'

  resource :page, only: [] do
    collection do
      get :home
    end
  end
end
