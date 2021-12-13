Rails.application.routes.draw do
  resources :players, only: [:index, :show]
  root "players#index"
end
