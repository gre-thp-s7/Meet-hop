class Event < ApplicationRecord
  belongs_to :locality

  has_many :category_events
  has_many :categories, through: :category_events

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  belongs_to :promoter, class_name:'User'

	validates :name,
		presence: true,
    length: { in: 5..140 }

	validates :description,
		presence: true,
    length: { in: 20..1000 }

	validates :start_date,
		presence: true

	validates :duration,
		presence: true,
		numericality: { only_integer: true}

	validates :spectator_price,
		presence: true
    # numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

	validates :rules,
		presence: true

	validates :prize_money,
		presence: true,
		allow_blank: true


	# validates :location,
	# 	presence: true


# methode intéressantes pour plus tard?
#  scope :in_the_past, { where('start_date < ?', Time.now }
#  scope :in_the_future, { where('start_date > ?', Time.now




	validate :is_future
	def is_future
		if start_date.present? && start_date < Time.now
			errors.add(:expiration_date, "dans le futur c'est mieux !")
		end
	end



end
