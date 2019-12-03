class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.integer :artist_id
    	t.integer :label_id
    	t.integer :category_id
    	t.string :name
    	t.datetime :release
    	t.integer :sales_status, :status, default: 1
    	t.integer :price
    	t.string :image_id
    	t.datetime :deleted_at

      t.timestamps
    end

    add_index :items, :artist_id
    add_index :items, :label_id
    add_index :items, :category_id
    add_index :items, :deleted_at

  end
end
