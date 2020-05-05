Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
        resources :horoscopes, only: [:create, :index, :show]
    end

    namespace :api do
      resources :dailies, only: [:create, :index]
  end
end





