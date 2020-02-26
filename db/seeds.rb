# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def gerar_produtos
  url = 'https://www.lojaoutside.com.br/index.php?route=product/category&category_id=365&page=4&ajax=1'

  produtos = JSON.parse(URI.open(url).read)

  produtos.each do |produto|
    novo_produto = Produto.create(
      nome: produto['name'],
      descricao: produto['description'],
      preco: produto['price'].sub('R$', '').sub(',', '.'),
      quantidade: rand(0..30)
    )

    imagem = produto['thumb'].sub('cache/', '').sub(/-[0-9]{2,4}x[0-9]{2,4}/, '')

    file = URI.open(imagem)
    filename = File.basename(URI.parse(imagem).path)
    novo_produto.imagens.attach(io: file, filename: filename)
  end
end

def gerar_cliente
  cliente = Cliente.create(
    nome: Faker::Name.first_name,
    sobrenome: Faker::Name.last_name,
    email: 'cliente@email.com',
    telefone: Faker::PhoneNumber.cell_phone,
    cpf: '419.356.777-05'
  )

  Endereco.create(
    tipo: :entrega,
    rua: Faker::Address.street_name,
    numero: Faker::Address.building_number,
    complemento: Faker::Address.secondary_address,
    bairro: 'Centro',
    cep: Faker::Address.zip_code,
    cidade: Faker::Address.city,
    uf: Faker::Address.state_abbr,
    cliente: cliente
  )

  cliente
end

def gerar_pedido(cliente)
  p1 = Produto.first
  p2 = Produto.last

  item1 = Item.new(
    produto_id: p1.id,
    produto_nome: p1.nome,
    valor_unitario: p1.preco,
    quantidade: 1,
    valor_total: p1.preco
  )

  item2 = Item.new(
    produto_id: p2.id,
    produto_nome: p2.nome,
    valor_unitario: p2.preco,
    quantidade: 2,
    valor_total: p2.preco * 2
  )

  pedido = Pedido.create(
    status: :novo,
    cliente: cliente,
    endereco_entrega_id: cliente.enderecos.last.id,
    subtotal: item1.valor_total + item2.valor_total,
    total: item1.valor_total + item2.valor_total
  )

  pedido.itens << item1
  pedido.itens << item2
end

# cliente = gerar_cliente
gerar_pedido(Cliente.last)

