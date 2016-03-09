Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: "links#index"

  resources :links, only: [:show, :new, :create, :update] do
    member do
      patch 'upvote'
      patch 'downvote'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
end
