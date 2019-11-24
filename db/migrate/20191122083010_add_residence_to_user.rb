class AddResidenceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :residence, :string
    remove_column :users, :address, :string
    add_column :addresses, :address, :string
    remove_column :addresses, :residence, :string
  end
end
