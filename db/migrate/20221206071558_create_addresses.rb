class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :street_address
      t.string :phone_number
      t.boolean :is_default
      t.string :remark
      t.references :user
      t.references :address_region
      t.references :address_province
      t.references :address_city_municipality
      t.references :address_barangay
      t.timestamps
    end
  end
end
