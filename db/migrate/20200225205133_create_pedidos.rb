class CreatePedidos < ActiveRecord::Migration[6.0]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :cliente_nome
      t.string :cliente_sobrenome
      t.string :cliente_email
      t.string :cliente_telefone
      t.string :endereco_entrega_rua
      t.string :endereco_entrega_numero
      t.string :endereco_entrega_complemento
      t.string :endereco_entrega_bairro
      t.string :endereco_entrega_cep
      t.string :endereco_entrega_cidade
      t.string :endereco_entrega_uf
      t.string :status
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end
