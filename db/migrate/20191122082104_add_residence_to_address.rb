class AddResidenceToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :residence, :string
    add_column :orders, :order_address, :string
    remove_column :orders, :address, :string
    remove_column :addresses, :address, :string
    remove_column :addresses, :address_id, :integer
    remove_column :addresses, :order_id, :integer
  end
end
