feature 'User registration' do
  context 'with valid credentials' do
    let (:user)  { user = build(:user) }

    scenario 'a user can sign up' do
      visit '/'
      expect(page).to have_content "Welcome to Chitter!"
      expect(page).to have_button "Sign up"

      click_button 'Sign up'
      expect(current_path).to eq '/users/new'

      within 'h1#heading' do
        expect(page).to have_content "Sign up"
      end

      expect{ sign_up(user) }.to change{ User.count }.by 1
      expect(current_path).to eq '/'
      expect(page).not_to have_content "Welcome to Chitter!"
      expect(page).not_to have_button "Sign up"
      expect(page).to have_content "Hello, test-user!"
    end
  end

  context 'with non-matching password and confirmation' do
    let (:user)  { user = build(:user, password_confirmation: "incorrect_password") }

    scenario 'a user cannot sign up and sees an error message' do
      expect{ sign_up(user) }.not_to change{ User.count }
      expect(current_path).to eq '/users'
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end
  end
end
