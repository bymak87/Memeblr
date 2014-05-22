require 'spec_helper'


describe "database" do

  let(:db) {Memeblr::DB.new}
  describe "db as a singleton" do
    it "returns a DB object" do
      expect(db).to be_a(Memeblr::DB)
    end
  end
  describe ".initialize method" do
    it "initialized db should empty hashes and id counters as 0" do
      expect(db.memes).to be_a(Hash)
      expect(db.memes.size).to eq(0)
      expect(db.next_meme_id).to eq(0)
      expect(db.admin).to be_a(Hash)
      expect(db.admin.size).to eq(0)
      expect(db.next_admin_id).to eq(0)
    end
  end

  #############
  # memes Class
  #############

  describe "memes CRUD methods" do
    data = {username: "Shehzan", password: "123"}
    describe ".create_memes" do
      xit "creates an entry in @memes hash" do
        db.memes(data)
        expect(db.memes.size).to eq(1)
        expect(db.memes[1][:id]).to eq(1)
        expect(db.memes[1][:username]).to eq("Shehzan")
        expect(db.memes[1][:password]).to eq("123")
      end
      xit "returns an memes object" do
        user1 = db.create_memes(data)
        expect(user1).to be_a(Memeblr::User)
        expect(user1.id).to eq(1)
        expect(user1.name).to eq("Joe")
        expect(user1.password).to eq("123")
      end
    end
    describe ".get_user" do
      xit "returns the correct user object" do
        db.create_memes(data)
        user1 = db.get_user(1)
        expect(user1).to be_a(Memeblr::User)
        expect(user1.id).to eq(1)
        expect(user1.name).to eq("Joe")
        expect(user1.password).to eq("123")
      end
    end

    describe ".update_user" do
      xit "updates the correct user" do
        user1 = db.create_memes(data)
        expect(user1.name).to eq("Joe")
        user1 = db.update_user(1,{name: "Bob"})
        expect(user1).to be_a(Memeblr::User)
        expect(user1.id).to eq(1)
        expect(user1.name).to eq("Bob")
        expect(user1.password).to eq("123")
      end
      xit "does nothing if user doesn't exist" do
        # ERROR: undefined method `merge!' for nil:NilClass
        # need to add check in update_user so it doesnt do anything if nil
        db.create_memes(data)
        expect(db.memes.size).to eq(1)
        user1 = db.update_user(45,{name: "Bob"})
        expect(user1).to eq(nil)
        expect(db.memes.size).to eq(1)
      end
    end

    describe ".delete_user" do
      xit "deletes the correct user" do
        # ERROR
        # @memes.delete[id] should be
        # @memes.delete(id) -- change brackets to parentheses
        db.create_memes(data)
        expect(db.memes.size).to eq(1)
        db.delete_user(1)
        expect(db.memes.size).to eq(0)
      end
      xit "does nothing if user not found or empty hash" do
        db.delete_user(45)
        expect(db.memes.size).to eq(0)
        db.create_memes(data)
        expect(db.memes.size).to eq(1)
        db.delete_user(45)
        expect(db.memes.size).to eq(1)
      end
    end
  end

  #############
  # admin Class
  #############

  describe "admin CRUD methods" do
    data = {id:}
    describe ".create_admin" do
      xit "creates an entry in @admin hash" do
        ## Error. rename create_admin to create_admin (non-plural) for consistency
        ## Error line 45 in db.rb, admins should be admin (note the "e")
        ## Error in admin.rb, change @admin_id to @id for simplicity and consistency
        ##            make sure to also change the attr_reader
        ##        ex. admin1.admin_id vs admin1.id
        db.create_admin(data)
        expect(db.admin.size).to eq(1)
        expect(db.admin[1][:admin_id]).to eq(1)
        expect(db.admin[1][:p1_id]).to eq(1)
        expect(db.admin[1][:p2_id]).to eq(2)
      end
      xit "returns a admin object" do
        admin1 = db.create_admin(data)
        expect(admin1).to be_a(Memeblr::admin)
        expect(admin1.admin_id).to eq(1)
        expect(admin1.p1_id).to eq(1)
        expect(admin1.p2_id).to eq(2)
      end
    end

    describe ".get_admin" do
      xit "returns the correct admin object" do
        db.create_admin(data)
        admin1 = db.get_admin(1)
        expect(admin1).to be_a(Memeblr::admin)
        expect(admin1.p1_id).to eq(1)
        expect(admin1.p2_id).to eq(2)
      end
    end

    describe ".update_admin" do
      xit "updates the correct admin" do
        admin1 = db.create_admin(data)
        expect(admin1.p1_id).to eq(1)
        expect(admin1.p2_id).to eq(2)
        admin1 = db.update_admin(1,{p1_id: 10, p2_id: 20})
        expect(admin1).to be_a(Memeblr::admin)
        expect(admin1.p1_id).to eq(10)
        expect(admin1.p2_id).to eq(20)
      end
      xit "does nothing if admin doesn't exist" do
        # ERROR: undefined method `merge!' for nil:NilClass
        # need to add check in update_admin so it doesnt do anything if nil
        db.create_admin(data)
        expect(db.admin.size).to eq(1)
        admin1 = db.update_admin(45,{p1_id: 10, p2_id: 20})
        expect(admin1).to eq(nil)
        expect(db.admin.size).to eq(1)
      end
    end

    describe ".delete_admin" do
      xit "deletes the correct admin" do
        # ERROR
        # @admins.delete[id] should be
        # @admins.delete(id) -- change brackets to parentheses
        db.create_admin(data)
        expect(db.admin.size).to eq(1)
        db.delete_admin(1)
        expect(db.admin.size).to eq(0)
      end
      xit "does nothing if admin not found or empty hash" do
        db.delete_admin(45)
        expect(db.admin.size).to eq(0)
        db.create_admin(data)
        expect(db.admin.size).to eq(1)
        db.delete_admin(45)
        expect(db.admin.size).to eq(1)
      end
    end
  end

end
