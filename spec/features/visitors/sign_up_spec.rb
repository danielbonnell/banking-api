include Warden::Test::Helpers
Warden.test_mode!

feature "Sign Up", %{
  As a user, I want to register an account, so that I can access the app.
  Acceptance Criteria:
  * [X] - I can register an account with my access credentials provided by
          Geezeo.
  * [X] - I see an error if my credentials are invalid.
  }, :devise do

  before(:each) do
    Warden.test_reset!
  end

  scenario "visitor can sign up with valid credentials" do
    sign_up_with("test@example.com", "please123", "please123", "danielb")
    expect(page).to have_content "danielb"
  end

  scenario "visitor cannot sign up with invalid username" do
    sign_up_with("test@example.com", "please123", "please123", "something")
    expect(page).to have_content "Username invalid"
  end

  scenario "visitor cannot sign up with invalid email address" do
    sign_up_with("bogus", "please123", "please123", "danielb")
    expect(page).to have_content "Email is invalid"
  end

  scenario "visitor cannot sign up without password" do
    sign_up_with("test@example.com", "", "", "danielb")
    expect(page).to have_content "Password can't be blank"
  end

  scenario "visitor cannot sign up with an invalid password" do
    sign_up_with("test@example.com", "please", "please", "danielb")
    expect(page).to have_content "Password is too short"
  end

  scenario "visitor cannot sign up without password confirmation" do
    sign_up_with("test@example.com", "please123", "", "danielb")
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "visitor cannot sign up with mismatched password and confirmation" do
    sign_up_with("test@example.com", "please123", "mismatch", "danielb")
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "visitor cannot sign up without an API username" do
    sign_up_with("test@example.com", "please123", "please123", "")
    expect(page).to have_content "Username can't be blank"
  end
end
