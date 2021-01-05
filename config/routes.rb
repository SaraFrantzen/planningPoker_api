Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:omniauth_callbacks]
  namespace :api do
    resources :polls, only: [:index, :create, :show, :update]
    resources :comments, only: [:create, :show]
  end
end
