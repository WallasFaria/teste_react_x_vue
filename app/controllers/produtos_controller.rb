# frozen_string_literal: true

class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show update destroy]

  def index
    @produtos = Produto.all
  end

  def show; end

  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      render :show, status: :created, location: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  def update
    if @produto.update(produto_params)
      render :show, status: :ok, location: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @produto.destroy
  end

  private

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
  end
end
