class CreateAdminCategoryShips < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_category_ships do |t|
      t.references :admin
      t.references :category
      t.timestamps
    end
  end
end
