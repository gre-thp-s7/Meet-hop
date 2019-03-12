class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #=================== MAILER =================
  # Send an email after a user is created
  after_create :send_welcome_email

  def send_welcome_email

    # Tell the UserMailer to send a welcome email after save
    UserMailer.welcome_email(self).deliver_now

  end
  #=============================================
end
