JobsRubyTw::Application.routes.draw do
  get '/about' => 'pages#about', :as => "about"

  devise_for :users

  resources :jobs do
    member do
      patch :open
      patch :close
    end
    collection do
      post :preview
      patch :preview
    end
  end

  root "jobs#index"
end
