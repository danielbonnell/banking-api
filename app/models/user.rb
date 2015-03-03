class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
            presence: "Username can't be blank",
            uniqueness: "Username already in use"
  # validate :validate_username
  #
  # private
  #
  # def validate_username
  #   true
  # end
end
