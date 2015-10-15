class RenameKeyOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :key
  end
end
