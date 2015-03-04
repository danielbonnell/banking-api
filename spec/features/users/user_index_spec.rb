include Warden::Test::Helpers
Warden.test_mode!

feature 'User index page', %{
  As an authenticated user, I want to see a list of my recent transactions and
  accounts with their balances, so I have an overview of my financial situation.
  Acceptance Criteria:
  * [ ] - I see all of my accounts listed on the dashboard.
  * [ ] - I see the balance of each account.
  * [ ] - I see a breakdown of my total available funds and or debts.
  * [ ] - I see a list of my most recent transactions.
  }, :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario 'user sees own email address' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit users_path
    expect(page).to have_content user.email
  end
end
