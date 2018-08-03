class CreatePieces < ActiveRecord::Migration[5.1]
  def change
    create_table :pieces do |t|
      t.integer :screenshot_id, foreign_key: true
      t.boolean :checked

      t.timestamps
    end
  end
end
