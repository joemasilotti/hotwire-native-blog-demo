Rails.application.routes.draw do
  resources :comments, only: %i[index destroy]
  resource :session, only: %i[new create destroy]

  resources :posts do
    resources :comments, only: %i[new create]
  end

  namespace :hotwire do
    resource :configurations, only: [] do
      get "ios_v1"
      get "android_v1"
    end
  end

  root "posts#index"
end
