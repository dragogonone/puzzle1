class ChangeTimeToDatetime < ActiveRecord::Migration
  def change
    add_column :users, :created_at, :datetime
    add_column :users, :win_at, :datetime
  end
end
