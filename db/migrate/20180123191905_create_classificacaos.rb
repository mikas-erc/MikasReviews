class CreateClassificacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :classificacaos do |t|
      t.integer :classificacao

      t.timestamps
    end
  end
end
