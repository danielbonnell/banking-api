require 'rails_helper'

feature 'Home page', %{
  As a user, I can to view the homepage, so that I can confirm the app is working.
  Acceptance Criteria:
  * [X] - I can see the homepage of the app.
  } do

  scenario 'user visits the home page' do
    visit root_path
    expect(page).to have_content 'Welcome'
  end

end
