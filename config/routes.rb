SinkIt::Application.routes.draw do
  devise_for :users

  root :to => "games#index"

  namespace :api do
  	resources :games, defaults: {format: :json} do
      member do 
        post :fire
      end
    end
  end
end
