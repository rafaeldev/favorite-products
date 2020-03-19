Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  resources :clients do
    patch '/add_product', to: 'clients#add_product'
  end
end
