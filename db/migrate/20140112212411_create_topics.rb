class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
