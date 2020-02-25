Rails.application.routes.draw do
  defaults format: :json do
    resources :itens
    resources :pedidos
    resources :enderecos
    resources :clientes
    resources :produtos
  end
end
