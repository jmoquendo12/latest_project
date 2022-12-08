class Address::CityMunicipality < ApplicationRecord
  validates :name, presence: true
  validates :code, uniqueness: true

  has_many :barangays
  belongs_to :province, optional: true
  has_many :addresses, class_name: 'Addresses', foreign_key: 'address_city_municipality_id'
end
