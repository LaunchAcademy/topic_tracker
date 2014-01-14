class AddCategoryToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :category, :string
  end

  def down
    remove_column :topics, :category
  end
end
