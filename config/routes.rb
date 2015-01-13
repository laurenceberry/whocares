Rails.application.routes.draw do
  devise_for :contributors
  devise_for :admins, :path => '', :path_names => {:sign_in => 'sign_in', :sign_out => 'sign_out'}

  resources :professions do
    collection { post :import }
    resources :roles do
      collection { post :import }
    end
  end

  resources :conditions do
    collection { post :import }
  end

  resources :tags, only: [:index, :show]

  root 'pages#index'

end
