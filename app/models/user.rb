class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    presence: true,
    inclusion: { in: :valid_usernames, message: "Username invalid" }

  def accounts
    output = {}
    api_call = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{self.username}/accounts/all"
    ).fetch("accounts")

    groups.map do |group|
      output[group[0]] = api_call.dup.keep_if do |account|
        group[1].include?(account.fetch("account_type"))
      end
    end

    output
  end

  def net_worth(*type)
    api_call = JSON.parse(RestClient.get "#{BASE_URI}/users/#{username}/networth")

    if !type.empty?
      api_call[type[0]].map do |account|
        [account.fetch("name"), account.fetch("balance").to_f]
      end
    else
      api_call.fetch("meta")
    end
  end

  def transactions(page=1)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{self.username}/transactions?page=#{page}"
    ).fetch("transactions")[0..9]
  end

  protected

  def valid_usernames
    api_call = JSON.parse(RestClient.get "#{BASE_URI}/users/").fetch("users")
    output = []

    api_call.each do |user|
      output << user.fetch("login") unless user.fetch("login").nil?
    end

    output
  end

  private

  def groups
    {
      "Cash Accounts" => ["checking", "savings", "money_market"],
      "Debt Accounts" => ["autos", "creditline", "home", "loan", "student_loans"],
      "Investments" => ["investment"],
      "Asset" => ["asset", "cd"],
      "Credit Cards" => ["cards"],
      "Bills" => ["bill"]
    }
  end
end
