require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to have_many(:occurrences)}
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:cpf) }
  it { expect(subject).to validate_presence_of(:birth) }
  it { expect(subject).to validate_presence_of(:password) }
  it { expect(subject).to validate_uniqueness_of(:cpf) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
