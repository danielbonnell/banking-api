class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    presence: true,
    inclusion: { in: :valid_usernames, message: "Username invalid" }

  def account
    @account ||= Account.new
  end

  protected

  def valid_usernames
    api_call = JSON.parse(RestClient.get "#{BASE_URI}/users/")["users"]
    output = []

    api_call.each do |user|
      output << user["login"] unless user["login"].nil?
    end

    output
  end
end
