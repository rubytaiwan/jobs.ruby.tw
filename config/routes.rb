Rails.application.routes.draw do

  namespace :cpanel do
    resources :jobs, only:[:index, :destroy]
  end

  get '/about' => 'pages#about', :as => 'about'

  devise_for :users

  resources :jobs do
    member do
      put :open
      put :close
    end
    collection do
      post :preview
      put :preview
    end
  end

  root to: 'jobs#index'
  match '*unmatched_route', to: redirect{'/'}, via: :all

end
