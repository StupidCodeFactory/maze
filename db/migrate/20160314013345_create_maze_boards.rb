ceclass CreateMazeBoards < ActiveRecord::Migration
  def change
    create_table :maze_boards do |t|
      t.integer :start_x, null: false
      t.integer :start_y, null: false
      t.integer :end_x,   null: false
      t.integer :end_y,   null: false

      t.timestamps null: false
    end
  end
end
