require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
    let(:author) { User.new(name: 'Someone') }
    subject { described_class.new(author_id: author.id, title: 'ArticleTitle', text: 'ArticleText') }
    p subject
    it 'is valid with a valid name' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name shorter than 2 characters' do
      subject.name = 'K'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name longer than 20 characters' do
      subject.name = 'AnExtremelyWierdEnoughLongName'
      expect(subject).to_not be_valid
    end
  end

  context 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
    it { should have_many(:articles).through(:votes) }
  end
end