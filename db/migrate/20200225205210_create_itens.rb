class CreateItens < ActiveRecord::Migration[6.0]
  def change
    create_table :itens do |t|
      t.references :pedido, null: false, foreign_key: true
      t.references :produto, null: false, foreign_key: true
      t.string :produto_nome
      t.integer :quantidade
      t.decimal :valor_unitario
      t.decimal :valor_total

      t.timestamps
    end
  end
end
