feature 'Create peeps' do
  let(:user)    { create(:user) }
  let(:peep)    { build(:peep) }

  context 'when logged in' do
    scenario 'a user can post a peep and see it' do
      log_in
      visit '/'
      click_button "Post a peep"
      expect(current_path).to eq '/peeps/new'
      expect{ post_peep }.to change { Peep.count }.by 1
      expect(current_path).to eq '/peeps'
      within first('.peep') do
        expect(page).to have_content "Test peep"
        expect(page).to have_content "Posted by #{user.username} aka #{user.name}"
      end
    end
  end

  context 'when not logged in' do
    scenario 'a user cannot post a peep and is redirected to log in' do
      expect{ post_peep }.not_to change { Peep.count }
      expect(current_path).to eq '/sessions/new'
      expect(page).to have_content "Please log in to continue"
    end
  end
end
