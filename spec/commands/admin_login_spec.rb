require 'spec_helper'

describe MEMEBLR::LogInAdmin do
  before(:each) do

    it "should return a admin object on success" do
      data = {username: "Shehzan", password: "123"}
      admin = MEMEBLR.db.create_admin(data)

      result = subject.run(data)
      expect(result.success?).to eq(true)
      expect(result.admin).to be_a(MEMEBLR::admin)
      expect(result.admin.id).to eq(1)
      expect(result.admin.username).to eq(data[:username])
      expect(result.admin.password).to eq(data[:password])
    end

    it "should return error if adminname does not exist" do
      data = {username: "Shehzan", password: "123"}
      result = subject.run(data)
      expect(result.success?).to eq(false)
      expect(result.error).to eq(:admin_name_does_not_exist)
    end


  end
end
