require './app/models/user'

describe User do
  describe '.authenticate' do
    let(:user)    { create(:user) }

    context 'when the email and password are correct' do
      it 'returns the user' do
        expect(User.authenticate(email: user.email, password: user.password)).to eq user
      end
    end

    context 'when the email is incorrect' do
      it 'returns nil' do
        expect(User.authenticate(email: "incorrect@example.com", password: user.password)).to eq nil
      end
    end

    context 'when the password is incorrect' do
      it 'returns nil' do
        expect(User.authenticate(email: user.email, password: "incorrect password")).to eq nil
      end
    end
  end
end
