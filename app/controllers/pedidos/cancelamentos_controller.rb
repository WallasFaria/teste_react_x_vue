class Pedidos::CancelamentosController < ApplicationController
  before_action :authenticate_cliente!

  def create
    @pedido = CancelarPedido.new(params, cliente_atual).call

    if @pedido.valid?
      render 'pedidos/show', status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end
end
