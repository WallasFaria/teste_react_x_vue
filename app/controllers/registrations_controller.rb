class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  private

  def sign_up_params
    params.permit(:nome, :sobrenome, :cpf, :telefone, :email, :password)
  end
end
