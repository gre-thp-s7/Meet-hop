class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :registration_dance
  has_many :categories, through: :registration_dance

  #===================USER MAILER=================
  # Send an email to the current user after he is registered to an event
  after_create :send_registration_email

  def send_registration_email

    UserMailer.registration_email(user, event).deliver_now

  end

  #================PROMOTER MAILER =============
  # Send an email to the promoter after a user is registered to an event
  after_create :send_event_registration_email

  def send_event_registration_email

    PromoterMailer.event_registration_email(user, event).deliver_now

  end

  # Send an email when the promoter update an event
  after_update :send_event_update_email
  def send_event_update_email

    PromoterMailer.event_update_email(user, event).deliver_now

  end
end
