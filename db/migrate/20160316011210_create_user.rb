class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :password_digest, :null => false
      t.integer :coil, :default => 81
      t.integer :pikachu, :default => 625
    end
  end
end
