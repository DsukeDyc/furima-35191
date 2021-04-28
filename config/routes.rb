Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create,] do #:edit, :update] do
  end
end
