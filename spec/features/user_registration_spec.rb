feature 'User registration' do
  context 'with valid credentials' do
    scenario 'a user can sign up' do
      visit '/'
      expect(page).to have_content "Welcome to Chitter!"
      expect(page).to have_button "Sign up"

      click_button 'Sign up'
      expect(current_path).to eq '/users/new'

      within 'h1#heading' do
        expect(page).to have_content "Sign up"
      end
      fill_in :name, with: "Test User"
      fill_in :email, with: "test@example.com"
      fill_in :username, with: "test-user"
      fill_in :password, with: "password123"
      fill_in :password_confirmation, with: "password123"
      click_button "Submit"

      expect(current_path).to eq '/'
      expect(page).not_to have_content "Welcome to Chitter!"
      expect(page).not_to have_button "Sign up"
      expect(page).to have_content "Hello, test-user!"
    end
  end
end
