require 'rails_helper'

RSpec.describe Occurrence, type: :model do
  it { expect(subject).to validate_presence_of(:description)}
  it { expect(subject).to belong_to(:user)}

  it 'has a valid factory' do
    expect(build(:occurrence)).to be_valid
  end
end
