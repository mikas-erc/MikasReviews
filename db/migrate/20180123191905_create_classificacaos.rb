class CreateClassificacaos < ActiveRecord::Migration[5.1]
  def change
    create_table :classificacaos do |t|
      t.integer :classificacao

      t.timestamps
    end
    add_index :classificacaos, [:conta_id, :created_at]
  end
end
