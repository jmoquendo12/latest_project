class BarangaySerializer < ActiveModel::Serializer
  attributes :name, :city_municipality, :id, :code

  def city_municipalities
    object.city_municipality.name
  end

end
