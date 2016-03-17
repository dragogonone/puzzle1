class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
    remove_column :users, :created_at
    remove_column :users, :win_at
    add_column :users, :created_at, :datetime
    add_column :users, :win_at, :datetime
  end
end
