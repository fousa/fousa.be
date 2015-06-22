Rails.application.routes.draw do
  resource :home, controller: :home, only: :show

  resources :expenses, except: [:show, :index]
  resources :invoices, except: [:show, :index]

  root 'home#show'
end
