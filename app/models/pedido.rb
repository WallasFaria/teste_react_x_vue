# frozen_string_literal: true

class Pedido < ApplicationRecord
  attr_writer :endereco_entrega_id

  enum status: {
    novo: 'novo',
    aprovado: 'aprovado',
    enviado: 'enviado',
    concluido: 'concluido',
    cancelado: 'cancelado'
  }

  belongs_to :cliente
  has_many :itens

  before_create :preenche_informacoes_do_cliente
  before_create :preenche_informacoes_do_endereco_de_entrega

  with_options presence: true do
    validates :cliente
    validates :itens, associated: true
    validates :subtotal
    validates :total
    validates :endereco_entrega_rua, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_numero, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_complemento, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_bairro, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_cep, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_cidade, if: -> { @endereco_entrega_id.blank? }
    validates :endereco_entrega_uf, if: -> { @endereco_entrega_id.blank? }
  end

  private

  def preenche_informacoes_do_cliente
    self.cliente_nome = cliente.nome
    self.cliente_sobrenome = cliente.sobrenome
    self.cliente_email = cliente.email
    self.cliente_telefone = cliente.telefone
  end

  def preenche_informacoes_do_endereco_de_entrega
    return unless @endereco_entrega_id.present?

    endereco = Endereco.find @endereco_entrega_id

    self.endereco_entrega_rua = endereco.rua
    self.endereco_entrega_numero = endereco.numero
    self.endereco_entrega_complemento = endereco.complemento
    self.endereco_entrega_bairro = endereco.bairro
    self.endereco_entrega_cep = endereco.cep
    self.endereco_entrega_cidade = endereco.cidade
    self.endereco_entrega_uf = endereco.uf
  end
end
