class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :category_id
      t.string :url
      t.string :name
      t.integer :price
      t.string :currency_id
      t.string :avaliable
      t.string :picture
      t.string :store
      t.text :pickup
      t.string :delivery
      t.integer :local_delivery_cost
      t.string :vendor
      t.string :model
      t.text :description
      t.text :sales_notes
      t.string :manufacturer_warranty

      t.timestamps
    end
  end
end
