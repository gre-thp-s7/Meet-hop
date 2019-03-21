class Category < ApplicationRecord
  has_many :category_events
  has_many :events, through: :category_events

  has_many :registration_dances
  has_many :registrations, through: :registration_dances

end
