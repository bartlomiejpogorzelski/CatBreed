class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  enum role: %i[user admin]

  after_initialize :set_default_role, if: :new_record?
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def set_default_role
    self.role ||= :user
  end
end
