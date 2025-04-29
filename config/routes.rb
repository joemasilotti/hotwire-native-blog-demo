Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[new create]
  end

  resources :comments, only: %i[index destroy]

  root "posts#index"
end
