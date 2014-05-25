require 'sqlite3'
# require_relative 'memeblr.rb'

class MEMEBLR::SQLDB

  def initialize
    @db = SQLite3::DB.new("test.db")

    @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS memes(
      id integer,
      title string,
      url string,
      like boolean,
      PRIMARY KEY(id)
      );
      SQL

     @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS admins(
      id integer,
      username string,
      password string,
      PRIMARY KEY(id)
      );
      SQL
  end

  def build_meme(data)
    MEMEBLR::Memes.new(id: data[:id], url: data[:url])
  end

  def add_meme(data)
    @db.execute <<-SQL
    INSERT INTO memes (id, url)
    VALUES ("#{data[:url]}")
    SQL
  end

  def get_meme(id)
    record = @db.execute <<-SQL
    SELECT url FROM memes
    WHERE id = "#{id}"
    SQL
    build_meme(record.all)
  end

  def delete_meme(data, id)
    @db.execute <<-SQL
    DELETE FROM memes
    WHERE id = id
    SQL
  end

  def build_admin(data)
    MEMEBLR::Admins.new(id: data[:id], username: data[:username], password: data[:password])
  end

  def create_admin(data)
    @db.execute <<-SQL
    INSERT INTO admins (id, username, password)
    VALUES ("#{data[:username]}", "#{data[:password]}")
    SQL
  end

  def get_admin(data, id)
    @db.execute <<-SQL
    SELECT * username FROM admins
    SQL
  end

  def delete_admin(data, id)
    @db.execute <<-SQL
    DELETE FROM admins
    WHERE id = id
    SQL
  end

end
