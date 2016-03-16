class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.integer :user_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
