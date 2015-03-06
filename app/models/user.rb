class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
            presence: "Username can't be blank",
            uniqueness: "Username already in use"

  def account
    @account ||= Account.new
  end
end
