Rails.application.routes.draw do
  resource :page do
    collection do
      get :home
    end
  end

  root 'pages#home'
end
