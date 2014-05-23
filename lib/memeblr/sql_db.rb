class Memeblr::SQLDB

  def initialize
    @db = SQLite3::Database.new "test.db"

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
    Memeblr::Meme.new(data)
  end

  def create_meme(data)
    @db.execute <<-SQL
    INSERT INTO memes (id, title, url)
    VALUES ("#{data[:title]}", "#{data[:url]}")
    SQL
  end

  def get_meme(id)
    record = @db.execute <<-SQL
    SELECT * FROM memes
    WHERE id = "#{id}"
    SQL
  end

  def delete_meme(data, id)
    @db.execute <<-SQL
    DELETE FROM memes
    WHERE id = id
    SQL
  end

  def build_admin(data)
    Memeblr::Admin.new(data)
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
