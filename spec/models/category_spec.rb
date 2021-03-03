require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Validations' do
    subject { described_class.new(name: 'CategoryName') }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Associations' do
    it { should have_and_belong_to_many(:articles) }
  end
end
