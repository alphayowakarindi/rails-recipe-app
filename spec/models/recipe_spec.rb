require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here
  @user_one = User.create(name: 'ALphayo', email: 'alphayo@gmail.com', password: '123456')
  subject do
    Recipe.new(user_id: @user_one, name: 'Ugali', preparation_time: '3 hrs', cooking_time: '3 hrs',
               description: 'Yeeees')
  end

  before { subject.save }

  it 'recipe user to be the user that created it' do
    expect(subject.user).to be == @user_one
  end

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the preparation_time must be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'the cooking_time must be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'the description must be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end
end
