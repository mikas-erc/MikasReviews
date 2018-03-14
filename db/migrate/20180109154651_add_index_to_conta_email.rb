class AddIndexToContaEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :conta, :email, unique: true
    add_index :conta, :nickname, unique: true
  end
end
