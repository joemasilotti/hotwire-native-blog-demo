Rails.application.routes.draw do
  resources :comments, only: %i[index destroy]
  resource :session, only: %i[new create destroy]

  resources :posts do
    resources :comments, only: %i[new create]
  end

  root "posts#index"
end
