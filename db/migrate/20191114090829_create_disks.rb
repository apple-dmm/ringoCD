class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
    	t.integer :item_id
    	t.integer :disk_num
      t.timestamps
    end
  end
end
