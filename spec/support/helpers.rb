module Helpers
  def sign_up(user)
    visit '/users/new'
    fill_in :name, with: user.name
    fill_in :email, with: user.email
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button "Submit"
  end

  def log_in(email: user.email, password: user.password)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Submit"
  end

  def post_peep
    visit '/peeps/new'
    fill_in :content, with: peep.content
    click_button "Submit"
  end
end
