# frozen_string_literal: true

class ClientesController < ApplicationController
  before_action :authenticate_cliente!
  before_action :set_cliente, only: %i[show update]

  def show; end

  def update
    if @cliente.update(cliente_params)
      render :show, status: :ok
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  private

  def set_cliente
    @cliente = cliente_atual
  end

  def cliente_params
    params.require(:cliente).permit(:nome, :sobrenome, :email, :telefone, :cpf)
  end
end
