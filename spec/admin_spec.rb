require 'spec_helper'

describe 'admin class' do
  context 'initialize method' do
    it "should have id, username, and password" do
      data = {id: 1, username: "Shehzan", password: "123"}
      admin1 = Memeblr::Admin.new(data)
      expect(admin1.id).to eq(1)
      expect(admin1.username).to eq("Shehzan")
      expect(admin1.password).to eq("123")
    end
  end
end
