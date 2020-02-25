# frozen_string_literal: true

class Endereco < ApplicationRecord
  enum tipo: { cobranca: 'cobranca', entrega: 'entraga' }
  belongs_to :cliente
end
