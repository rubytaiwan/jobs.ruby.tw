# -*- encoding : utf-8 -*-
JobsRubyTw::Application.routes.draw do
  get '/about' => 'pages#about', :as => "about"

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

  root "jobs#index"
end
