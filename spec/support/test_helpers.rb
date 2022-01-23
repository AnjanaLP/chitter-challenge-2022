module TestHelpers
  def sign_up(name: "Test User",
              email: "test@example.com",
              username: "test-user",
              password: "password123",
              password_confirmation: "password123")

    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end
end
