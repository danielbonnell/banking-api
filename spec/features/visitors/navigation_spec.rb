feature 'Navigation links', %{
  As an authenticated user, I want to navigate to different areas of my
  account, so that I can see what information is available.
  Acceptance Criteria:
  * [X] - I can navigate to other parts of the app.
  }, :devise do
  scenario 'view navigation links' do
    visit root_path
    expect(page).to have_content 'Home'
    expect(page).to have_content 'Sign in'
    expect(page).to have_content 'Sign up'
  end
end
