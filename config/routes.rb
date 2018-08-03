Rails.application.routes.draw do
  resources :piece_types
  resources :types
  resources :pieces
  resources :screenshots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'screenshots#index'
  get 'pieces/:id/classify', to: 'pieces#piece_type'
end
