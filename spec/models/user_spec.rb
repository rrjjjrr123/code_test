require 'rails_helper'

RSpec.describe User, type: :model do

  it 'email must be unique' do
    user1 = User.new(email: 'bugs@disney.com')
    user1.save

    user2 = User.new(email: 'bugs@disney.com')
    user2.save
    expect(user2.errors[:email]).to eq(["has already been taken"])
  end
end
