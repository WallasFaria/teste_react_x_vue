# frozen_string_literal: true

json.extract! item, :id, :pedido_id, :produto_id, :produto_nome, :quantidade, :valor_unitario, :valor_total, :created_at, :updated_at
json.url item_url(item, format: :json)
