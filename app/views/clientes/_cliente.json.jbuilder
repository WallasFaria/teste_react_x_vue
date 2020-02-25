# frozen_string_literal: true

json.extract! cliente, :id, :nome, :sobrenome, :email, :telefone, :cpf
json.enderecos cliente.enderecos
