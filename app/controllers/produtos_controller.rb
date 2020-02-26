# frozen_string_literal: true

class ProdutosController < ApplicationController
  def index
    @produtos = Produto.all
  end

  def show
    @produto = Produto.find(params[:id])
  end
end
