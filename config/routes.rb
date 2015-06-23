Rails.application.routes.draw do
  resource :dashboard, controller: :dashboard, only: :show
  resource :quarter, controller: :quarter, only: :show

  resources :expenses, except: [:show, :index]
  resources :invoices, except: [:show, :index]

  root 'dashboard#show'
end
