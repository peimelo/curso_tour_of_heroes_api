require 'rails_helper'

RSpec.describe Hero, type: :model do
  subject { Hero.new(name: 'Thor', token: '1234567890') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:token) }

    it { should validate_length_of(:token).is_at_least(10) }

    it { should validate_uniqueness_of(:name).scoped_to(:token).case_insensitive }
  end

  describe 'scopes' do
    it '.by_token' do
      expect(Hero.where(token: '1234567890').to_sql).to eq Hero.by_token('1234567890').to_sql
    end

    it '.search' do
      expect(Hero.where('LOWER(name) LIKE ?', '%thor%').to_sql).to eq Hero.search('thor').to_sql
    end

    it '.sorted_by_name' do
      expect(Hero.order(:name).to_sql).to eq Hero.sorted_by_name.to_sql
    end
  end
end
