feature "Sign out", %{
  As an authenticated user, I want to log out, so that others cannot access my
  account.
  Acceptance Criteria:
  * [X] - I can log out from the app.
  * [X] - I can not longer access my account after logging out.
  }, :devise do
  scenario "user signs out successfully" do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t "devise.sessions.signed_in"
    click_link "Sign out"
    expect(page).to have_content I18n.t "devise.sessions.signed_out"
  end
end
