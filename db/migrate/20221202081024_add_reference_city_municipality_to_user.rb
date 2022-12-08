class AddReferenceCityMunicipalityToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :city_municipality
  end
end
