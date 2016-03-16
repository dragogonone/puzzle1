class AlterUserComment < ActiveRecord::Migration
  def change
    remove_column :users, :commented

    add_column :users, :win_comment, :string, :default => nil
  end
end
