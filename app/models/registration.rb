class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event


  #=================== MAILER =================
  # Send an email after a user is registered to an event
  after_create :send_registration_email

  def send_registration_email

    # Tell the UserMailer to send a comfirmation email after a resgistration is create
    UserMailer.registration_email(self).deliver_now

  end
  #=============================================
end
