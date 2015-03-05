class User < ActiveRecord::Base
  require "rest_client"

  BASE_URI = "https://#{ENV['TOKEN']}@sales.geezeo.com/api/v2"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
            presence: "Username can't be blank",
            uniqueness: "Username already in use"

  def accounts
    api_call = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{username}/accounts"
    )["accounts"]

    output = {}
    groups = {
      "Cash Accounts" => ["checking", "savings", "money_market"],
      "Debt Accounts" => ["autos", "creditline", "home", "loan", "student_loans"],
      "Investments" => ["investment"],
      "Asset" => ["asset", "cd"],
      "Credit Cards" => ["cards"],
      "Bills" => ["bill"]
    }

    groups.each do |group|
      current_group = []

      api_call.each do |account|
        current_group << account if group[1].include?(account["account_type"])
      end

      output[group[0]] = current_group
    end
    output
  end
end
