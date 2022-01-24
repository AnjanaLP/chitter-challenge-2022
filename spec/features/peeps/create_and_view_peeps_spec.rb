require 'timecop'

feature 'Create and view peeps' do
  let(:user)    { create(:user) }

  context 'when logged in' do
    scenario 'a user can post a peep' do
      log_in
      visit '/'
      click_button "Post a peep"
      expect(current_path).to eq '/peeps/new'
      expect{ post_peep("Test peep") }.to change { Peep.count }.by 1
      expect(current_path).to eq '/peeps'
      within first('.peep') do
        expect(page).to have_content "Test peep"
      end
    end
  end

  context 'when not logged in' do
    scenario 'a user cannot post a peep and is redirected to log in' do
      expect{ post_peep("Test peep") }.not_to change { Peep.count }
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "Please log in to continue"
    end
  end

  context 'when logged in or out' do
    scenario "see peeps in reverse order with poster's name & username and peep's time & date" do
      log_in
      Timecop.freeze do
        post_peep("First peep")
      end
      Timecop.travel(DateTime.now + 1) do
        post_peep("Latest peep")
      end
      see_all_peeps
      expect(page).not_to have_link "View peeps"
      click_button "Log out"
      click_link "View peeps"
      see_all_peeps
    end
  end

  def see_all_peeps
    within page.find('.peep:nth-of-type(1)') do
      expect(page).to have_content "Latest peep"
      expect(page).to have_content "Posted by #{user.username} aka #{user.name} #{(DateTime.now + 1).strftime('at %H:%M on %d-%m-%Y')}"
    end

    within page.find('.peep:nth-of-type(2)') do
      expect(page).to have_content "First peep"
      expect(page).to have_content "Posted by #{user.username} aka #{user.name} #{DateTime.now.strftime('at %H:%M on %d-%m-%Y')}"
    end
  end
end
