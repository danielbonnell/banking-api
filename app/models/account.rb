class Account
  require "rest_client"

  def all(user)
    api_call = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/accounts/all"
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

  def account(user, id)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/accounts/#{id}"
    )["accounts"][0]
  end

  def net_worth(user)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/networth"
    )["meta"]
  end

  def balance(user, type)
    api_call = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/networth"
    )[type]

    output = []

    api_call.each do |account|
      output << [account["name"], account["balance"].to_f]
    end

    output
  end

  def transactions(user, page)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/transactions?page=#{page}"
    )["transactions"][0..9]
  end
end
