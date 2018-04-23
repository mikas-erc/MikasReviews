class CreateSeguidos < ActiveRecord::Migration[5.1]
  def change
    create_table :seguidos do |t|
      t.integer :idseguidor
      t.integer :idseguido
      t.timestamps
    end
  end
end
