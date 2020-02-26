# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  with_options presence: true do
    validates :produto_nome, if: -> { produto_id.blank? }
    validates :valor_unitario
    validates :valor_total
    validates :quantidade
  end

  validate :calculo_total

  before_create :preenche_nome_do_produto

  private

  def preenche_nome_do_produto
    self.produto_nome = produto.nome
  end

  def calculo_total
    return unless valor_total && quantidade && valor_unitario

    unless valor_total.to_f == (quantidade * valor_unitario.to_f)
      errors.add(:valor_total, 'Valor incorreto')
    end
  end
end
