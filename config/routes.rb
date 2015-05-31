Rails.application.routes.draw do
  devise_for :contributors, :path => '', :path_names => {:sign_in => 'sign_in', :sign_out => 'sign_out'}
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

  resources :jobs

  resources :tags, only: [:index, :show]

  root 'pages#index'
  get "about" => "pages#about" #creates about path
  get "contact" => "pages#contact" #creates about path

end
