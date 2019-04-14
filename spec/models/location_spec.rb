require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:citystate)}
    it { should validate_presence_of(:latitude)}
    it { should validate_presence_of(:longitude)}
    it { should have_many :favorites }
    it { should have_many :users }
  end
end
