class Event < ApplicationRecord

############# link between tables ################@

  belongs_to :locality

  has_many :category_events
  has_many :categories, through: :category_events

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  belongs_to :promoter, class_name:'User'

############### validations ##############

	validates :name,
		presence: true,
    length: { in: 5..140 }

	validates :description,
		presence: true,
    length: { in: 20..10000 }

	validates :start_date,
		presence: true

	validates :duration,
		presence: true,
		numericality: { only_integer: true}

	validates :spectator_price,
		presence: true

	validates :rules,
		presence: true

	validates :prize_money,
		presence: true,
		allow_blank: true


	# validates :location,
	# 	presence: true



############  method verifiction for the start date to include
	# validate :is_future
	# def is_future
	# 	if start_date.present? && start_date < Time.now
	# 		errors.add(:expiration_date, "dans le futur c'est mieux !")
	# 	end
	# end
#######################################################@


end
