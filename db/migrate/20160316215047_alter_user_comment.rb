class AlterUserComment < ActiveRecord::Migration
  def change
    add_column :users, :win_comment, :string, :default => nil
  end
end
