require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here
  @user_one = User.create(name: 'ALphayo', email: 'alphayo@gmail.com', password: '123456')
  subject { Food.new(user_id: @user_one, name: 'Onion', measurment_unit: 'kg', price: 8) }

  before { subject.save }

  it 'food user to be the user that created it' do
    expect(subject.user).to be == @user_one
  end

  it 'measurment_unit must be present' do
    subject.measurment_unit = nil
    expect(subject).to_not be_valid
  end

  it 'the name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
