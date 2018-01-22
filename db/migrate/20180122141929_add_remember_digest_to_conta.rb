class AddRememberDigestToConta < ActiveRecord::Migration[5.1]
  def change
    add_column :conta, :remember_digest, :string
  end
end
