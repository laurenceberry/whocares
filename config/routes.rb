Rails.application.routes.draw do
  devise_for :admins
  resources :professions do
    collection { post :import }
    resources :roles do
      collection { post :import }
    end
  end

  root 'pages#index'

end
