class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :fullname, presence: true, length: {maximum: 50}

  has_many :rooms, dependent: :destroy
  


  has_attached_file :avatar, dependent: :destroy
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  

  def self.from_omniauth(auth)
  	user = User.where(email: auth.info.email).first

  	if user
  		return user
  	else
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  			user.fullname = auth.info.name
  			user.provider = auth.provider
  			user.uid = auth.uid
  			user.email = auth.info.email
  			user.image = auth.info.image
  			user.password = Devise.friendly_token[0,20]
  		end
  	end
  end
end
