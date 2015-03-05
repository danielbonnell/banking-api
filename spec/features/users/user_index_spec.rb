include Warden::Test::Helpers
Warden.test_mode!

feature "User index page", %{
  As an authenticated user, I want to see a list of my recent transactions and
  accounts with their balances, so I have an overview of my financial situation.
  Acceptance Criteria:
  * [X] - I see all of my accounts listed on the dashboard.
  * [X] - I see the balance of each account.
  * [ ] - I see a breakdown of my total available funds and or debts.
  * [ ] - I see a list of my most recent transactions.
  }, :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario "user sees accounts" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path

    user.accounts.each do |account|
      expect(page).to have_content account[0]["name"] unless account[0].empty?
    end
  end

  scenario "user sees account balances" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path

    user.accounts.each do |account|
      expect(page).to have_content account[0]["balance"] unless account[0].empty?
    end
  end
end
