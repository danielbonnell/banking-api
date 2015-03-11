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

    # Group accounts by type for display in overview page
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
      # Return an array of account names and balances for use with HighCharts
      api_call[type[0]].map do |account|
        [account.fetch("name"), account.fetch("balance").to_f]
      end
    else
      # Return a hash with total_debts, total_assets, and net_worth
      api_call.fetch("meta")
    end
  end

  def transactions(page = 1)
    # Limit 10 transactions for overview
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{self.username}/transactions?page=#{page}"
    ).fetch("transactions")[0..9]
  end

  protected

  def valid_usernames
    # Check API to see if username is registered
    JSON.parse(RestClient.get "#{BASE_URI}/users/").fetch("users").map do |user|
      user.fetch("login") unless user.fetch("login").nil?
    end
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
