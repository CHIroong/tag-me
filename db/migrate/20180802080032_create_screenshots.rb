class CreateScreenshots < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots do |t|
      t.boolean :isFinished
      t.string  :assignee
      t.string  :image

      t.timestamps
    end
  end
end
