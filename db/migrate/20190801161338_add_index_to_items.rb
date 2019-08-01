class AddIndexToItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :id
    add_index :items, :name
    add_index :categories, :id
  end
end
