class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
    	t.string :name
    	t.string :postal_code
    	t.string :order_address
    	t.integer :payment, :status
    	t.integer :total
    	t.integer :delivery_status, :status, default: 0
    	t.integer :delivery_fee
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
