# frozen_string_literal: true

class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show update destroy]

  def index
    @pedidos = Pedido.all
  end

  def show; end

  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      render :show, status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pedido.update(pedido_params)
      render :show, status: :ok, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pedido.destroy
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def pedido_params
    params.require(:pedido).permit(:cliente_id, :cliente_nome, :cliente_sobrenome, :cliente_email, :cliente_telefone, :endereco_entrega_rua, :endereco_entrega_numero, :endereco_entrega_complemento, :endereco_entrega_bairro, :endereco_entrega_cep, :endereco_entrega_cidade, :endereco_entrega_uf, :status, :subtotal, :total)
  end
end
