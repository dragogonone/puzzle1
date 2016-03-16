class DropTableWinner < ActiveRecord::Migration
  def change
     drop_table :winners
  end
end
