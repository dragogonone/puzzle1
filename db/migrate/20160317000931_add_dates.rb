class AddDates < ActiveRecord::Migration
  def change
    add_column :users, :created_at, :time
    add_column :users, :win_at, :time
  end
end
