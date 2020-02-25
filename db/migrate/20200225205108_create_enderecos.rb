class CreateEnderecos < ActiveRecord::Migration[6.0]
  def change
    create_table :enderecos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.string :tipo
      t.string :rua
      t.integer :numero
      t.string :complemento
      t.string :bairro
      t.string :cep
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
