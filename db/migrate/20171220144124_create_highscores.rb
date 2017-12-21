class CreateHighscores < ActiveRecord::Migration[5.1]
  def change
    create_table :highscores do |t|
      t.string :username
      t.string :game
      t.string :mode
      t.integer :action
      t.float :aps

      t.timestamps
    end
  end
end
