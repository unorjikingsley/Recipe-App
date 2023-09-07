require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'requires a name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end

    it 'requires a measurement_unit' do
      food = Food.new(measurement_unit: nil)
      expect(food).to_not be_valid
    end

    it 'requires a price' do
      food = Food.new(price: nil)
      expect(food).to_not be_valid
    end

    it 'requires a user' do
      food = Food.new(user: nil)
      expect(food).to_not be_valid
    end

    it 'requires a quantity' do
      food = Food.new(quantity: nil)
      expect(food).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
