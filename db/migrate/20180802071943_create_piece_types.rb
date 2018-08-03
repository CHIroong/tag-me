class CreatePieceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :piece_types do |t|
      t.belongs_to :piece, foreign_key: true, null: false
      t.belongs_to :type, foreign_key: true, null: false

      t.timestamps
    end
  end
end