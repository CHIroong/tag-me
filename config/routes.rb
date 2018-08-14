Rails.application.routes.draw do
  resources :screenshots

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'screenshots#index'

  post '/screenshots/:id/pieces', to: 'screenshots#create_piece'
  get '/screenshots/:id/export', to: 'screenshots#export_piece'
  delete '/screenshots/:id/pieces/:piece_id', to: 'screenshots#destroy_piece'
  get '/pieces/:id/type/:type_id', to: 'screenshots#change_type'
end
