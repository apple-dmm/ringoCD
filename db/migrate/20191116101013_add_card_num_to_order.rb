class AddCardNumToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :card_num, :integer
    add_column :orders, :card_name, :string
    add_column :orders, :securitycode, :integer
  end
end
