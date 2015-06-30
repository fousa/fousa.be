Rails.application.routes.draw do
  resource :dashboard, controller: :dashboard, only: :show
  resource :quarter, controller: :quarter, only: :show

  resources :apps
  resources :customers, except: [:show]
  resources :expenses, except: [:show, :index]
  resources :invoices, except: [:index]

  resources "contacts", only: [:create]

  root 'home#show'
end
