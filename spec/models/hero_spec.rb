require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }
  end
end
