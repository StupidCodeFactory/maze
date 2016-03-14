class CreateMazeCells < ActiveRecord::Migration
  def change
    create_table :maze_cells do |t|
      t.integer :x,             null: false
      t.integer :y,             null: false
      t.integer :walls,         null: false, default: 0, limit: 1
      t.references :maze_board, null: false

      t.timestamps null: false
    end
  end
end
