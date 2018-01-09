class AddIndexToContaEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :conta, :email, unique: true
  end
end
