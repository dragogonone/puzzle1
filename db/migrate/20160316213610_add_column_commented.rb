class AddColumnCommented < ActiveRecord::Migration
  def up
    add_column :users, :commented, :boolean , :default => false
  end

  def down
    remove_column :users, :commented, :boolean
  end
end
