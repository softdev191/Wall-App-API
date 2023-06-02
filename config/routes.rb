Rails.application.routes.draw do
  post "/api/v1/login", to: "api/v1/sessions#create"
  post "/api/v1/signup", to: "api/v1/users#create"
  get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
  delete "/api/v1/logout", to: "api/v1/sessions#destroy"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        member do
          get :confirm_email
        end
      end
      resources :messages, only: [:index, :create]
    end
  end
end
