class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :cat_id
      t.integer :cat_parent_id
      t.string :cat_name

      t.timestamps
    end
  end
end
