Rails.application.routes.draw do
  defaults format: :json do
    resources :produtos, only: %i[index]
    resources :clientes, only: %i[show update]
    resources :enderecos
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
