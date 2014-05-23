require 'spec_helper'

describe 'admin class' do
  context 'initialize method' do
    it "should have username and password" do
      data = {username: "Shehzan", password: "123"}
      admin1 = Memeblr::Admins.new(data)
      expect(admin1.username).to eq("Shehzan")
      expect(admin1.password).to eq("123")
    end
  end
end
