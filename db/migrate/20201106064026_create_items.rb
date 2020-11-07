class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :image_data
      t.belongs_to :menu
      t.timestamps
    end
  end
end
