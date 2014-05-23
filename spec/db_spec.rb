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
      expect(db.admins).to be_a(Hash)
      expect(db.admins.size).to eq(0)
      expect(db.next_admin_id).to eq(0)
      expect(db.memes).to be_a(Hash)
      expect(db.memes.size).to eq(0)
      expect(db.next_meme_id).to eq(0)

    end
  end

  #############
  # Admins Class
  #############

  describe "Admins CRUD methods" do
    data = {username: "Shehzan", password: "123"}
    describe ".create_admin" do
      it "creates an entry in @admins hash" do
        db.admins(data)
        expect(db.admins.size).to eq(1)
        expect(db.admins[1][:id]).to eq(1)
        expect(db.admins[1][:username]).to eq("Shehzan")
        expect(db.admins[1][:password]).to eq("123")
      end
      xit "returns an admin object" do
        admin1 = db.create_admin(data)
        expect(admin1).to be_a(Memeblr::Admins)
        expect(admin1.id).to eq(1)
        expect(admin1.name).to eq("Shehzan")
        expect(admin1.password).to eq("123")
      end
    end
    describe ".get_admin" do
      xit "returns the correct admins object" do
        db.create_admin(data)
        admin1 = db.get_admins(1)
        expect(admin1).to be_a(Memeblr::admin)
        expect(admin1.id).to eq(1)
        expect(admin1.name).to eq("Joe")
        expect(admin1.password).to eq("123")
      end
    end

    describe ".update_admin" do
      xit "updates the correct admin" do
        admin1 = db.create_admin(data)
        expect(admin1.name).to eq("Joe")
        admin1 = db.update_admin(1,{name: "Bob"})
        expect(admin1).to be_a(Memeblr::admin)
        expect(admin1.id).to eq(1)
        expect(admin1.name).to eq("Bob")
        expect(admin1.password).to eq("123")
      end
      xit "does nothing if admin doesn't exist" do
        # ERROR: undefined method `merge!' for nil:NilClass
        # need to add check in update_admin so it doesnt do anything if nil
        db.create_admin(data)
        expect(db.admins.size).to eq(1)
        admin1 = db.update_admin(45,{name: "Bob"})
        expect(admin1).to eq(nil)
        expect(db.admins.size).to eq(1)
      end
    end

    describe ".delete_admin" do
      xit "deletes the correct admin" do
        # ERROR
        # @admins.delete[id] should be
        # @admins.delete(id) -- change brackets to parentheses
        db.create_admin(data)
        expect(db.admins.size).to eq(1)
        db.delete_admin(1)
        expect(db.admins.size).to eq(0)
      end
      xit "does nothing if admin not found or empty hash" do
        db.delete_admin(45)
        expect(db.admins.size).to eq(0)
        db.create_admin(data)
        expect(db.admins.size).to eq(1)
        db.delete_admin(45)
        expect(db.admins.size).to eq(1)
      end
    end
  end

  #############
  # Match Class
  #############

  describe "Match CRUD methods" do
    data = {p1_id: 1, p2_id: 2}
    describe ".create_match" do
      xit "creates an entry in @matches hash" do
        ## Error. rename create_matches to create_match (non-plural) for consistency
        ## Error line 45 in db.rb, matchs should be matches (note the "e")
        ## Error in matches.rb, change @match_id to @id for simplicity and consistency
        ##            make sure to also change the attr_reader
        ##        ex. match1.match_id vs match1.id
        db.create_match(data)
        expect(db.matches.size).to eq(1)
        expect(db.matches[1][:match_id]).to eq(1)
        expect(db.matches[1][:p1_id]).to eq(1)
        expect(db.matches[1][:p2_id]).to eq(2)
      end
      xit "returns a Match object" do
        match1 = db.create_match(data)
        expect(match1).to be_a(Memeblr::Match)
        expect(match1.match_id).to eq(1)
        expect(match1.p1_id).to eq(1)
        expect(match1.p2_id).to eq(2)
      end
    end

    describe ".get_match" do
      xit "returns the correct match object" do
        db.create_match(data)
        match1 = db.get_match(1)
        expect(match1).to be_a(Memeblr::Match)
        expect(match1.p1_id).to eq(1)
        expect(match1.p2_id).to eq(2)
      end
    end

    describe ".update_match" do
      xit "updates the correct match" do
        match1 = db.create_match(data)
        expect(match1.p1_id).to eq(1)
        expect(match1.p2_id).to eq(2)
        match1 = db.update_match(1,{p1_id: 10, p2_id: 20})
        expect(match1).to be_a(Memeblr::Match)
        expect(match1.p1_id).to eq(10)
        expect(match1.p2_id).to eq(20)
      end
      xit "does nothing if match doesn't exist" do
        # ERROR: undefined method `merge!' for nil:NilClass
        # need to add check in update_match so it doesnt do anything if nil
        db.create_match(data)
        expect(db.matches.size).to eq(1)
        match1 = db.update_match(45,{p1_id: 10, p2_id: 20})
        expect(match1).to eq(nil)
        expect(db.matches.size).to eq(1)
      end
    end

    describe ".delete_match" do
      xit "deletes the correct match" do
        db.create_match(data)
        expect(db.matches.size).to eq(1)
        db.delete_match(1)
        expect(db.matches.size).to eq(0)
      end
      xit "does nothing if match not found or empty hash" do
        db.delete_match(45)
        expect(db.matches.size).to eq(0)
        db.create_match(data)
        expect(db.matches.size).to eq(1)
        db.delete_match(45)
        expect(db.matches.size).to eq(1)
      end
    end
  end

end
