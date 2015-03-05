include Warden::Test::Helpers
Warden.test_mode!

feature "User profile page", %{
  As an authenticated user, I want to view my profile, so I can confirm that my
  information is correct.
  Acceptance Criteria:
  * [X] - I can view my profile.
  }, :devise do
  after(:each) do
    Warden.test_reset!
  end

  scenario "user sees own profile" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit user_path(user)
    expect(page).to have_content "User"
    expect(page).to have_content user.email
  end
end
