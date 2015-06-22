Rails.application.routes.draw do
  resources :home, controller: :home, only: :show

  resources :expenses, except: [:show, :index]

  root 'home#show'
end
