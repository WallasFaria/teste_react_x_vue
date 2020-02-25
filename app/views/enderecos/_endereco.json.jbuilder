# frozen_string_literal: true

json.extract! endereco,
  :id,
  :cliente_id,
  :tipo,
  :rua,
  :numero,
  :complemento,
  :bairro,
  :cep,
  :cidade,
  :uf,
  :created_at,
  :updated_at

  json.url endereco_url(endereco, format: :json)
