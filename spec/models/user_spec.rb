require 'rails_helper'
describe User do
  describe '#create' do

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end


  end
end