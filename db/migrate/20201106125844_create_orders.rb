class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :drink_id
      t.integer :main_id
      t.integer :first_id
      t.integer :menu_id
      t.belongs_to :user
      t.timestamps
    end
  end
end
