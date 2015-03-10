describe Account do
  before(:each) do
    user = FactoryGirl.create(:user, username: "danielb")
    @account = Account.new(user, user.accounts["Cash Accounts"][0]["id"])
  end

  it "#name returns a string" do
    expect(@account.name).to match "eChecking"
  end

  it "#balance returns a string" do
    expect(@account.balance).to match "300.54"
  end

  it "#reference_id returns a string" do
    expect(@account.reference_id).to match "789274930"
  end

  it "#aggregation_type returns a string" do
    expect(@account.aggregation_type).to match "partner"
  end

  it "#state returns a string" do
    expect(@account.state).to match "active"
  end

  it "#account_type returns a string" do
    expect(@account.account_type).to match "checking"
  end

  it "#fi returns a string" do
    expect(@account.fi).to match nil
  end

  it "#transactions returns an array of transaction hashes" do
    keys = [
      "id",
      "reference_id",
      "transaction_type",
      "memo",
      "balance",
      "posted_at",
      "created_at",
      "nickname",
      "original_name",
      "check_number",
      "tags",
      "links"
    ]

    expect(@account.transactions[0].keys).to match keys
  end
end
