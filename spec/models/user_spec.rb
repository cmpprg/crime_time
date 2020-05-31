require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it { should validate_presence_of :uid }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
  end

  describe "Instance Method" do
    it "can tell if it has a state attribute" do
      user = create(:user, state: nil)

      expect(user.state).to eql(nil)
      expect(user.has_state?).to eql(false)

      user.update(state: 'CO')

      expect(user.state).to eql('CO')
      expect(user.has_state?).to eql(true)
    end
  end
end
