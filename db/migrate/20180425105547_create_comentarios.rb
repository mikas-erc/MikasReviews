class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :tipo
      t.integer :tipoid
      t.text :texto
      t.references :conta, foreign_key: true
      t.timestamps
    end
  end
end
