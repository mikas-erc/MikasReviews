class CreateSteams < ActiveRecord::Migration[5.1]
  def change
    create_table :steams do |t|

      t.timestamps
    end
  end
end
