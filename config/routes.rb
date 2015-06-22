Rails.application.routes.draw do
  resources :expenses, except: :show

  root 'expenses#index'
end
