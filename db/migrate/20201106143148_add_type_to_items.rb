class AddTypeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :d_type, :string
  end
end
