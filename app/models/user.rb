class User < ApplicationRecord

  # before_save :avatar_picture
  before_save { self.email = email.downcase }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]


  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations

  has_many :created_events, class_name: "Event", foreign_key: 'promoter_id', dependent: :destroy


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, allow_blank: true
  validates :nick_name, uniqueness: true, allow_blank: true


########## something to try for validation ##############@
########## this is documentation wher i find this ################
# https://guides.rubyonrails.org/active_record_validations.html#common-validation-options ####


#####  email validation #########
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
####### end email validation #############


###### this is profile picture with active storage ######
  has_one_attached :avatar
#####################################


private

######### put a profile picture if there isn't #########
  # def avatar_picture
  #     if avatar_url == nil
  #       avatar_url = aws_s3_no_profile_picture_url
  #     end
  # end
#################################################


  #=============Connect with facebook==========
  def self.from_facebook(auth)

    where(facebook_id: auth.uid).first_or_create do |user|

      user.email = auth.info.email #find fb email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
       # a check si ça affiche publiquement
      user.password = Devise.friendly_token[0, 20] #genere un mdp aleatoire
      # user.skip_comfirmation!

    end
  end
  #============================================
  #=================== MAILER =================
  # Send an email after a user is created
  after_create :send_welcome_email

  def send_welcome_email

    # Tell the UserMailer to send a welcome email after save
    UserMailer.welcome_email(self).deliver_now

  end
  #=============================================
end
