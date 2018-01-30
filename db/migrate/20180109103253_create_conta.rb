class CreateConta < ActiveRecord::Migration[5.1]
  def change
    create_table :conta do |t|
      t.string :nome
      t.string :email
      t.string :tipo, default:"user"
      t.boolean :ativo, default:false
      t.datetime :ativado_em
      t.string :ativo_digest

      t.timestamps
    end
  end
end
