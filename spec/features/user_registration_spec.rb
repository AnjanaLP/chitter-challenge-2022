feature 'User registration' do
  let (:user)  { user = build(:user) }

  context 'successful sign up' do
    scenario 'valid credentials submitted' do
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

  context 'unsuccessful sign up' do
    scenario 'non-matching password and confirmation' do
      user = build(:user, password_confirmation: "incorrect_password")
      expect{ sign_up(user) }.not_to change{ User.count }
      expect(current_path).to eq '/users'
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario 'the email address is already taken' do
      sign_up(user)
      expect{ sign_up(user) }.not_to change{ User.count }
      expect(current_path).to eq '/users'
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_content "Email has already been taken"
    end

    scenario 'the username is already taken' do
      sign_up(user)
      expect{ sign_up(user) }.not_to change{ User.count }
      expect(current_path).to eq '/users'
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_content "Username has already been taken"
    end

    scenario 'name, email or username not provided' do
      attributes = [:name, :email, :username]
      attributes.each do |attribute|
        user = build(:user, "#{attribute}": nil)
        expect{ sign_up(user) }.not_to change{ User.count }
        expect(current_path).to eq '/users'
        expect(page).not_to have_content "Hello, test-user!"
        expect(page).to have_content "#{attribute.capitalize} can't be blank"
      end
    end

    scenario 'email address is invalid' do
      user = build(:user, email: "invalid")
      expect{ sign_up(user) }.not_to change{ User.count }
      expect(current_path).to eq '/users'
      expect(page).not_to have_content "Hello, test-user!"
      expect(page).to have_content "Email is invalid"
    end
  end
end
