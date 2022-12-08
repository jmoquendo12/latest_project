class RemoveReferenceProvince < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :address_province_id
    remove_column :users, :address_region_id
    remove_column  :users, :address_barangay_id
    remove_column :users, :city_municipality_id

  end
end
