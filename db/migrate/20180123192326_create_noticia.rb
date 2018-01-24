class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.string :nome
      t.text :texto
      t.text :descricao
      t.date :data
      t.string :foto

      t.timestamps
    end
  end
end
