class AddDeletedAtToItemOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :item_orders, :deleted_at, :datetime
  end
end
