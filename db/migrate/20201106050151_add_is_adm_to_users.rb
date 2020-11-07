class AddIsAdmToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_adm, :boolean
  end
end
