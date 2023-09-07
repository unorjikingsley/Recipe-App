require 'rails_helper'

time = Time.now
tm = time.to_formatted_s(:time)

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(name: 'Noddle', preparation_time: tm,
               cooking_time: tm, description: 'Very nice to have', public: true)
  end

  before { subject.save }

  describe 'validate the user model' do
    it { should allow_value('Noddle').for(:name) }
    it 'All user attributes must be present' do
      expect(subject.name).to eq('Noddle')
      expect(subject.description).to eq('Very nice to have')
      expect(subject.public).to be(true)
    end
  end
end
