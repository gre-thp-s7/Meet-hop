class User < ApplicationRecord

# before_save :avatar_picture
 before_save { self.email = email.downcase }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: { message: "must be given connard " }
  validates :phone, presence: true, allow_blank: true


############## try by yaya for validation ##############@
  validates :nick_name, uniqueness: true

#########@ this is documentation wher i find this ################    
##### https://guides.rubyonrails.org/active_record_validations.html#common-validation-options ####


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



#=================== MAILER =================
# Send an email after a user is created
# after_create :welcome_email_send

# def welcome_email_send

#   # Tell the UserMailer to send a welcome email after save
#   UserMailer.welcome_email(self).deliver_now

# end
#=============================================


private

######### put a profile picture if there isn't #########
  # def avatar_picture
  #     if avatar_url == nil
  #       avatar_url = aws_s3_no_profile_picture_url
  #     end
  # end
#################################################


end
