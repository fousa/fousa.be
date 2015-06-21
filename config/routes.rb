Rails.application.routes.draw do
  resources :expenses

  root 'expenses#index'
end
