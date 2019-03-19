class RegistrationDance < ApplicationRecord
  belongs_to :category
  belongs_to :registration


	validates :category_id,
		presence: :true

end
