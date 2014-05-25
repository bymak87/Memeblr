require 'sqlite3'
# require_relative 'memeblr.rb'

class MEMEBLR::SQLDB
  attr_reader :db

  def initialize
    @db = SQLite3::Database.new("test.db")

    @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS memes(
      id integer PRIMARY KEY AUTOINCREMENT,
      title string,
      url string,
      like boolean,
      );
      SQL

     @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS admins(
      id integer PRIMARY KEY AUTOINCREMENT,
      username string,
      password string,
      );
      SQL
  end

  #MEMES

  def build_meme(data)
    MEMEBLR::Memes.new(data[:id], data[:url], data[:like])
  end

  def create_meme(data)
    @db.execute <<-SQL
    INSERT INTO memes (url)
    VALUES ("#{data[:url]}");
    SQL
    result = @db.execute <<-SQL
      SELECT * FROM memes WHERE id=(SELECT MAX (id) FROM memes);
    SQL
    data = result.flatten
    build_meme(data)
  end

  def get_meme(id)
    records = @db.execute <<-SQL
    SELECT * FROM memes
    WHERE id =(SELECT MAX(id) FROM;
    SQL
    build_meme(records)
  end

  def delete_meme(data, id)
    @db.execute <<-SQL
    DELETE FROM memes
    WHERE id = "#{data[:id]}";
    SQL
  end

#Admin#

  def build_admin(data)
    MEMEBLR::Admins.new(data[:id], data[:username], data[:password])
  end

  def create_admin(data)
   ad = @db.execute <<-SQL
    INSERT INTO admins (username, password)
    VALUES ("#{data[:username]}", "#{data[:password]}");
    SQL
    build_admin(ad)
  end

  def get_admin(data, username)
    @db.execute <<-SQL
    SELECT * username FROM admins;
    SQL
  end

  # def delete_admin(data, id)
  #   @db.execute <<-SQL
  #   DELETE FROM admins
  #   WHERE id = "#{data[:id]}";
  #   SQL
  # end
end

#singleton
  module MEMEBLR
    def self.db
      @___db_instance ||=SQLDB.new
    end
  end
