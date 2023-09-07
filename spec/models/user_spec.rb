require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Daniel', email: 'dnladesanya1@gmail.com', password: '123456') }
  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Daniel').for(:name) }
    it { should validate_presence_of(:email) }
    it { should_not allow_value(nil, '').for(:email) }
    it { should allow_value(:password).for(:password) }

    it 'All user attributes must be present' do
      expect(subject.name).to eq('Daniel')
      expect(subject.email).to eq('dnladesanya1@gmail.com')
      expect(subject.password).to eq('123456')
    end

    describe 'check association' do
      it { should have_many(:foods) }
      it { should have_many(:recipes) }
    end
  end
end
