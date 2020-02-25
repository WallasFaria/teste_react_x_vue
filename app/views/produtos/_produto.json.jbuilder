# frozen_string_literal: true

json.extract! produto, :id, :nome, :descricao, :preco, :quantidade

json.imagens produto.imagens do |imagem|
  json.small rails_representation_url(imagem.variant(resize_to_limit: [100, 100]))
  json.medium rails_representation_url(imagem.variant(resize_to_limit: [600, 600]))
  json.large rails_blob_url(imagem)
end

json.url produto_url(produto, format: :json)
