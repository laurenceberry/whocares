Rails.application.routes.draw do
  devise_for :admins
  resources :professions do
    collection { post :import }
    resources :roles do
      collection { post :import }
    end
  end
  resources :tags, only: [:index, :show]

  root 'pages#index'

end
