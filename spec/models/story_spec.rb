require 'rails_helper'

RSpec.describe Story, type: :model do
  before do
    story = create(:story)
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe '#refresh_rates_average' do
    before do
      rate1 = create(:rate, rate_value: 1, story: story)
      rate2 = create(:rate, rate_value: 5, story: story)
    end

    it 'should be accurate' do
      expect { story.refresh_rates_average }.to change { story.rates_average }.from(0).to(3)
    end
  end
end