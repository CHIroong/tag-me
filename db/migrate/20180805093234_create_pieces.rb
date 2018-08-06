class CreatePieces < ActiveRecord::Migration[5.1]
  def change
    create_table :pieces do |t|
      t.integer :left
      t.integer :top
      t.integer :width
      t.integer :height
      t.belongs_to :screenshot, foreign_key: true
      t.belongs_to :type, optional: true

      t.timestamps
    end
    
    change_column_null :pieces, :type_id, true
  end
end
