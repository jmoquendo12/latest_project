class AddReferenceToUsersProvices < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address_province
  end
end
