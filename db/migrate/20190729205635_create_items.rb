class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.integer :item_cat_id
      t.string :item_url
      t.string :item_name
      t.integer :price
      t.string :currency_id
      t.boolean :avaliable
      t.string :picture
      t.boolean :store
      t.boolean :pickup
      t.boolean :delivery
      t.integer :local_delivery_cost
      t.string :vendor
      t.string :item_model
      t.text :description
      t.text :sales_notes
      t.boolean :manufacturer_warranty

      t.timestamps
    end
  end
end
