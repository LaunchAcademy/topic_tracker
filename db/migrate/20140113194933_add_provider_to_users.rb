class AddProviderToUsers < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string, null: false
    remove_column :users, :display_name
  end

  def down
    remove_column :users, :provider
    add_column :users, :display_name, :string
  end
end
