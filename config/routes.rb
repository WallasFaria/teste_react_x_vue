Rails.application.routes.draw do
  defaults format: :json do
    resources :produtos, only: %i[index]
    resources :clientes, only: %i[show update]
    resources :enderecos
    resources :pedidos, only: %i[index show create]
  end
end
