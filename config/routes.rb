Rails.application.routes.draw do
  resources :professions do
    resources :roles
  end

  root 'pages#index'

end
