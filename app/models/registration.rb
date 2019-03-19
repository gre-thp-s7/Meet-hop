class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :registration_dance
  has_many :categories, through: :registration_dance

  #===================USER MAILER=================
  # Send an email after a user is registered to an event
  after_create :send_registration_email

  def send_registration_email

    # Tell the UserMailer to send a comfirmation email after a resgistration is create
    UserMailer.registration_email(user, event).deliver_now

  end
  #=============================================
  #================PROMOTER MAILER =============
  # Send an email to the promoter after a user is registered to an event
  after_create :send_event_registration_email

  def send_event_registration_email

    # Tell the PromoterMailer to send a email to the Promoter after a resgistration is create
    PromoterMailer.event_registration_email(user, event).deliver_now

  end
  #=============================================
end
