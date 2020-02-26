# frozen_string_literal: true

class PedidosController < ApplicationController
  before_action :authenticate_cliente!

  def index
    @pedidos = cliente_atual.pedidos.all
  end

  def show
    @pedido = cliente_atual.pedidos.find(params[:id])
  end

  def create
    @pedido = CriarPedido.new(pedido_params).call

    if @pedido.valid?
      render :show, status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  private

  def pedido_params
    params.permit(
      :cliente_nome,
      :cliente_sobrenome,
      :cliente_email,
      :cliente_telefone,
      :endereco_entrega_id,
      :endereco_entrega_rua,
      :endereco_entrega_numero,
      :endereco_entrega_complemento,
      :endereco_entrega_bairro,
      :endereco_entrega_cep,
      :endereco_entrega_cidade,
      :endereco_entrega_uf,
      :status,
      :subtotal,
      :total,
      itens: %i[
        produto_id
        produto_nome
        quantidade
        valor_unitario
        valor_total
      ]
    ).merge(cliente_id: cliente_atual.id)
  end
end
