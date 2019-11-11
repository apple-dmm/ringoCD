class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
    	t.integer :item_id
    	t.string :name
    	t.integer :setlist
    	t.integer :disk_num

      t.timestamps
    end
  end
end
