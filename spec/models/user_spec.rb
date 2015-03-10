describe User do
  before(:each) do
    @user = User.new(email: 'user@example.com', username: 'danielb')
  end

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  it "#username returns a string" do
    expect(@user.username).to match 'danielb'
  end

  it "#accounts returns a hash" do
    keys = [
      "Cash Accounts",
      "Debt Accounts",
      "Investments",
      "Asset",
      "Credit Cards",
      "Bills"
    ]

    expect(@user.accounts.keys).to match keys
  end

  it "#net_worth returns a hash" do
    keys = [
      "net_worth",
      "net_worth_change",
      "total_assets",
      "total_debts"
    ]

    expect(@user.net_worth.keys).to match keys
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

    expect(@user.transactions[0].keys).to match keys
  end
end
