Rails.application.routes.draw do
  defaults format: :json do
    resources :produtos, only: %i[index show]
    resources :pedidos, only: :create

    scope 'conta' do
      get :dados_pessoais, to: 'clientes#show', as: :dados_pessoais
      put :dados_pessoais, to: 'clientes#update', as: :atualizar_dados_pessoais
      resources :enderecos
      resources :pedidos, only: %i[index show] do
        resources :cancelamentos, only: :create, module: :pedidos
      end
    end

    devise_for :clientes, path: '',
                          path_names: {
                            sign_in: 'login',
                            sign_out: 'logout',
                            registration: 'signup'
                          },
                          controllers: {
                            sessions: 'sessions',
                            registrations: 'registrations'
                          }
  end
end
