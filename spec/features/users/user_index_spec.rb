# Include ActionView::Helpers::NumberHelper so that number_to_currency method
# will work, otherwise the test fails because balances are returned as strings.

include ActionView::Helpers::NumberHelper
include Warden::Test::Helpers
Warden.test_mode!

feature "User index page", %{
  As an authenticated user, I want to see a list of my recent transactions and
  accounts with their balances, so I have an overview of my financial situation.
  Acceptance Criteria:
  * [X] - I see all of my accounts listed on the dashboard.
  * [X] - I see the balance of each account.
  * [X] - I see a breakdown of my total available funds and or debts.
  * [X] - I see a list of my most recent transactions.
  }, :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario "user sees accounts" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path

    user.account.all(user).each do |account|
      expect(page).to have_content account[0]["name"] unless account[0].empty?
    end
  end

  scenario "user sees account balances" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path

    user.account.all(user).each do |account|
      expect(page).to have_content account[0]["balance"] unless account[0].empty?
    end
  end

  scenario "user sees breakdown of funds" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path

    expect(page).to have_content number_to_currency(user.account.net_worth(user)["total_assets"])
    expect(page).to have_content number_to_currency(user.account.net_worth(user)["total_debts"])
    expect(page).to have_content number_to_currency(user.account.net_worth(user)["net_worth"])
  end

  # scenario "user sees list of recent transactions" do
  #   user = FactoryGirl.create(:user)
  #   login_as(user, scope: :user)
  #   visit users_path
  #
  #   user.account.transactions(user, 1).each do |t|
  #     expect(page).to have_content Time.parse(t["posted_at"]).strftime("%m/%d/%Y")
  #     expect(page).to have_content number_to_currency(t["balance"])
  #     expect(page).to have_content t["transaction_type"]
  #     expect(page).to have_content t["original_name"]
  #     expect(page).to have_content t["memo"]
  #     expect(page).to have_content t["tags"].collect { |n| n["name"] }[0]
  #   end
  # end
end
