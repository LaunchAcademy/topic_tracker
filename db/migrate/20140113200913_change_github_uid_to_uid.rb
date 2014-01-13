class ChangeGithubUidToUid < ActiveRecord::Migration
  def up
    rename_column :users, :github_uid, :uid
  end

  def down
    rename_column :users, :uid, :github_uid
  end
end
