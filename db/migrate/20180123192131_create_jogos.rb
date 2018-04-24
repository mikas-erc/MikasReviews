class CreateJogos < ActiveRecord::Migration[5.1]
  def change
    create_table :jogos do |t|
      t.string :nome
      t.decimal :preco, :precision => 8, :scale => 2
      t.text :descricao
      t.string :developer
      t.integer :idsteam
      t.boolean :steam
      t.date :data_de_lancamento
      t.string :foto
      t.string :tags
      t.integer :favreview, default:0

      t.timestamps
    end
  end
end
