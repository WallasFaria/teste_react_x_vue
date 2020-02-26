# frozen_string_literal: true

class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      render :show, status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(
      :cliente_id,
      :cliente_nome,
      :cliente_sobrenome,
      :cliente_email,
      :cliente_telefone,
      :endereco_entrega_rua,
      :endereco_entrega_numero,
      :endereco_entrega_complemento,
      :endereco_entrega_bairro,
      :endereco_entrega_cep,
      :endereco_entrega_cidade,
      :endereco_entrega_uf,
      :itens,
      :status,
      :subtotal,
      :total
    )
  end
end
