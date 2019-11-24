class AddLastNameToOder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :last_name, :string
    remove_column :orders, :name, :string
  end
end
