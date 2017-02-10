class RenameLastNameinUsertoAlias < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :last_name, :alias
  end
end
