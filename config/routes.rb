Rails.application.routes.draw do
  resource :quarter, controller: :quarter, only: :show

  resources :expenses, except: [:show, :index]
  resources :invoices, except: [:show, :index]

  root 'quarter#show'
end
