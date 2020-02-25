# frozen_string_literal: true

json.array! @pedidos, partial: 'pedidos/pedido', as: :pedido, locals: { details: false }
