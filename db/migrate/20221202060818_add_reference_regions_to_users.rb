class AddReferenceRegionsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address_region
  end
end
