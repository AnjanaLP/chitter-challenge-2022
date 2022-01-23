feature 'Create peeps' do
  let(:user)    { create(:user) }
  let(:peep)    { build(:peep) }

  context 'when logged in' do
    scenario 'a user can post a peep and see it' do
      log_in
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
end
