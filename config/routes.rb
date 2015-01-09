Rails.application.routes.draw do
  devise_for :admins
  resources :professions do
    resources :roles
  end

  root 'pages#index'

end
