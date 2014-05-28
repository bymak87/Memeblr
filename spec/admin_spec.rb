require 'spec_helper'

  describe 'Admins' do
    it 'exists' do
      expect(Admins).to be_a(Class)
    end

  context 'initialize method' do
    it "should have username and password" do
      admin = MEMEBLR::Admins.new(id: 1, username: "Shehzan", password: "123")
      expect(admin.username).to eq("Shehzan")
      expect(admin.password).to eq("123")
    end
  end

end
