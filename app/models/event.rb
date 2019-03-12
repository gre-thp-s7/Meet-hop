class Event < ApplicationRecord

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
		presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

	validates :rules, 
		presence: true,

	validates :prize_money, 
		presence: true,
		allow_blank: true


	validates :location, 
		presence: true

  has_many :registration, dependent: :destroy
  has_many :users, through: :attendances
  belongs_to :is_admin, class_name: "User"


# methode intéressantes pour plus tard?
#  scope :in_the_past, { where('start_date < ?', Time.now }
#  scope :in_the_future, { where('start_date > ?', Time.now 


  validate :duration_format_ok
	def duration_format_ok
	  if duration.present? &&	duration%5 != 0
			errors.add(:duration_format, "puts correct duration format")
		end

	end

	validate :is_future
	def is_future
		if start_date.present? && start_date < Time.now
			errors.add(:expiration_date, "dans le futur c'est mieux !")
		end
	end



end
