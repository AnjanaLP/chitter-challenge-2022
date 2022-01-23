feature 'User authentication' do
  let(:user)    { create(:user) }

  context "successful log in" do
    scenario 'correct email and password submitted' do
      visit '/'
      expect(page).to have_button "Log in"
      click_button "Log in"
      expect(current_path).to eq '/sessions/new'
      log_in
      expect(current_path).to eq '/'
      expect(page).to have_content "Successfully logged in"
      expect(page).to have_content "Hello, test-user!"
      expect(page).not_to have_button "Log in"
    end
  end

  context "unsuccessful log in" do
    scenario 'incorrect email submitted' do
      log_in(email: "incorrect@example.com")
      expect(current_path).to eq '/sessions'
      expect(page).to have_content "Incorrect email/password"
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_button "Log in"
      expect(page).not_to have_button "Log out"
    end

    scenario 'incorrect password submitted' do
      log_in(password: "incorrect password")
      expect(current_path).to eq '/sessions'
      expect(page).to have_content "Incorrect email/password"
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_button "Log in"
      expect(page).not_to have_button "Log out"
    end
  end

  scenario 'a logged in user can log out' do
    log_in
    expect(page).to have_button "Log out"
    click_button "Log out"
    expect(page).to have_content "Successfully logged out"
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).not_to have_content "Hello, test-user!"
    expect(page).to have_button "Log in"
    expect(page).to have_button "Sign up"
    expect(page).not_to have_button "Log out"
  end
end
