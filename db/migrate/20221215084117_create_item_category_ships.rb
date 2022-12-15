class CreateItemCategoryShips < ActiveRecord::Migration[7.0]
  def change
    create_table :item_category_ships do |t|
      t.references :items
      t.references :categories
      t.timestamps
    end
  end
end
