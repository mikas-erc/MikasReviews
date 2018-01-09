class AddPasswordDigestToConta < ActiveRecord::Migration[5.1]
  def change
    add_column :conta, :password_digest, :string
  end
end
