class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  # ,:omniauthable, omniauth_providers: [:auth0]

  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def set_default_role
    self.role ||= :user
  end  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end
end
