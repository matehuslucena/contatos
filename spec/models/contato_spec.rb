require 'rails_helper'

describe Contato do

  it 'has a valid factory' do
    expect(create(:contato)).to be_valid
  end

  it 'is invalid without a name'do
    expect(build(:contato, name: nil)).not_to be_valid
  end

  it 'is invalid without a last_name' do
    expect(build(:contato, last_name: nil)).not_to be_valid
  end

end