Rails.application.routes.draw do
  root 'repositories#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :repositories, only: [:index]
    end
  end
end
