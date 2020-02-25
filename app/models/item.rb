# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto
end
