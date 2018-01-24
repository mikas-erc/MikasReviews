class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.text :texto
      t.text :descricao
      t.string :foto

      t.timestamps
    end
  end
end
