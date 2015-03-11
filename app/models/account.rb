class Account
  require "rest_client"
  attr_reader :user, :id

  def initialize(user, id)
    @user = user
    @id = id
    @account = JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{user.username}/accounts/#{id}"
    ).fetch("accounts").first
  end

  def property(type)
    # Fetch an account property (e.g. name, balance, etc.)
    @account.fetch(type)
  end

  def transactions(page = 1)
    JSON.parse(
      RestClient.get "#{BASE_URI}/users/#{@user.username}/accounts/#{@id}/transactions?page=#{page}"
    ).fetch("transactions")
  end
end
