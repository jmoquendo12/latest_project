class DistrictSerializer < ActiveModel::Serializer
  attributes :name, :region, :id, :code

  def region
    object.region.name
  end
end
