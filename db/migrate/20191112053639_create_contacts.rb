class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|

    	t.integer :end_user_id
    	t.string :title
    	t.text :body

      t.timestamps
    end
  end
end
