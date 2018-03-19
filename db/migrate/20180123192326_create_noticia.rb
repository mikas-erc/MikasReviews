class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.string :nome
      t.text :texto
      t.text :descricao
      t.date :data
      t.string :tags
      t.string :foto
      t.boolean :ativo
      t.references :conta, foreign_key: true

      t.timestamps
    end
  end
end
