# -*- encoding : utf-8 -*-
JobsRubyTw::Application.routes.draw do

  match '/about' => 'pages#about', :as => "about"

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

  root :to => "jobs#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  match "*path" => "pages#404"
end
