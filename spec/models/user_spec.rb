require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'class methods' do
    describe 'validates new' do
      it 'returns a true or false based on if it can create a new user' do
        result = User.validate_new({email: "email", password: "123", password_confirmation: "123"})

        expect(result).to eq(true)
        next_res = User.validate_new({email: "email", password: "123", password_confirmation: "123"})

        expect(next_res).to eq(false)
      end
    end
  end
end
