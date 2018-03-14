class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :texto
      t.integer :classificacao

      t.timestamps
    end
    add_index :reviews, [:conta_id, :created_at]
  end
end
