# frozen_string_literal: true

json.id pedido.id
json.cliente_id pedido.cliente_id
json.cliente_nome pedido.cliente_nome
json.cliente_sobrenome pedido.cliente_sobrenome
json.cliente_email pedido.cliente_email
json.cliente_telefone pedido.cliente_telefone
json.endereco_entrega_rua pedido.endereco_entrega_rua
json.endereco_entrega_numero pedido.endereco_entrega_numero
json.endereco_entrega_complemento pedido.endereco_entrega_complemento
json.endereco_entrega_bairro pedido.endereco_entrega_bairro
json.endereco_entrega_cep pedido.endereco_entrega_cep
json.endereco_entrega_cidade pedido.endereco_entrega_cidade
json.endereco_entrega_uf pedido.endereco_entrega_uf
json.status pedido.status

json.itens pedido.itens if details
json.quantidade_de_itens pedido.itens.sum(:quantidade)

json.subtotal pedido.subtotal
json.total pedido.total
json.created_at pedido.created_at
json.updated_at pedido.updated_at

json.url pedido_url(pedido, format: :json)
