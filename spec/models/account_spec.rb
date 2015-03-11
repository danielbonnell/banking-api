describe Account do
  before(:each) do
    user = FactoryGirl.create(:user, username: "danielb")
    @account = Account.new(user, user.accounts["Cash Accounts"][0]["id"])
  end

  it "#property returns a string" do
    expect(@account.property("name")).to match "eChecking"
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
