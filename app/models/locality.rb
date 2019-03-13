class Locality < ApplicationRecord
  has_many :events

	validates :city_name,
	presence: true

	validates :zipcode,
		presence: true

	validates :address,
		presence: true

end
