# frozen_string_literal: true

class EnderecosController < ApplicationController
  before_action :set_endereco, only: %i[show update destroy]

  def index
    @enderecos = Endereco.all
  end

  def show; end

  def create
    @endereco = Endereco.new(endereco_params)

    if @endereco.save
      render :show, status: :created, location: @endereco
    else
      render json: @endereco.errors, status: :unprocessable_entity
    end
  end

  def update
    if @endereco.update(endereco_params)
      render :show, status: :ok, location: @endereco
    else
      render json: @endereco.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @endereco.destroy
  end

  private

  def set_endereco
    @endereco = Endereco.find(params[:id])
  end

  def endereco_params
    params.require(:endereco).permit(:cliente_id, :tipo, :rua, :numero, :complemento, :bairro, :cep, :cidade, :uf)
  end
end
