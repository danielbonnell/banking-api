class Account
  require "rest_client"

  attr_reader :user, :id, :name, :balance, :reference_id,
              :aggregation_type, :account_type, :state, :fi

  def initialize(user, id)
    @user = user
    @id = id
    @account = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/accounts/#{id}"
    ).fetch("accounts").first
  end

  # I have been trying to figure out how to refactor this model into something
  # more DRY and expresive. I want to figure out how to generate the instance
  # methods dynamically, but I don't know how to do that yet.

  def name
    @account.fetch("name")
  end

  def balance
    @account.fetch("balance")
  end

  def reference_id
    @account.fetch("reference_id")
  end

  def aggregation_type
    @account.fetch("aggregation_type")
  end

  def account_type
    @account.fetch("account_type")
  end

  def state
    @account.fetch("state")
  end

  def fi
    @account.fetch("fi")
  end

  def transactions(page = 1)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{@user.username}/accounts/#{@id}/transactions?page=#{page}"
    ).fetch("transactions")
  end
end
