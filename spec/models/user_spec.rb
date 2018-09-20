require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_attributes) do
    { name: 'Example Name', email: 'example@email.com', password: 'example' }
  end
  let(:user) { User.new(user_attributes) }

  context 'when user does not have name' do
    before { user_attributes.delete(:name) }

    it 'does not allow to save user without name' do
      expect(user).to be_invalid
      expect(user.errors[:name]).to eq ['is too short (minimum is 3 characters)']
    end
  end

  context 'when user does not have email' do
    before { user_attributes.delete(:email) }

    it 'does not allow to save user without email' do
      expect(user).to be_invalid
      expect(user.errors[:email]).to eq ['is invalid']
    end
  end

  context 'when user does not have password' do
    before { user_attributes.delete(:password) }

    it 'does not allow to save user without password' do
      expect(user).to be_invalid
      expect(user.errors[:password]).to eq ['can\'t be blank', 'is too short (minimum is 6 characters)']
    end
  end

  context 'when user attributes are valid' do
    it { expect(user).to be_valid }
  end
end
