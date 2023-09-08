require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject { RecipeFood.new(quantity: 20) }

  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value(20).for(:quantity) }

    it 'All user attributes must be present' do
      expect(subject.quantity).to be_instance_of(Integer)
    end
  end
  describe 'check association' do
    it { should belong_to(:food) }
    it { should belong_to(:recipe) }
  end
end
