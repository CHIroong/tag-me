class CreateScreenshots < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots do |t|

      t.timestamps
    end
  end
end
