Rails.application.routes.draw do
  namespace :api do
    resources :polls, only: :index
  end
end
