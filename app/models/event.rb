class Event < ApplicationRecord

	#========== Link between tables ===========

  has_many :category_events
  has_many :categories, through: :category_events

  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations

  belongs_to :promoter, class_name:'User'

	#============= Validations =================

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
	
	validates :dancer_price,
	presence: true

	validates :rules,
		presence: true

	validates :prize_money,
		presence: true,
		allow_blank: true
	
	validates :city_name,
	presence: true

	validates :zipcode,
		presence: true

	validates :address,
		presence: true

	#======== Picture with active storage ========
	has_one_attached :picture

	private

	#== Method verifiction for the start date to include ==
	validate :is_future
	def is_future
		if start_date.present? && start_date < Time.now
			errors.add(:expiration_date, "Dans le futur c'est mieux !")
		end
	end

  #================ PROMOTER MAILER ======================
  # Send an email after a event is created
  after_create :send_event_creation_email

  def send_event_creation_email

    # Tell the PromoterMailer to send a event creation email after save
    PromoterMailer.event_creation_email(self).deliver_now

  end
end
