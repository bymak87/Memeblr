class Memeblr::SQLDB

  def initialize
    @db = SQLite3::Database.new "test.db"

    @db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS memes(
      id integer,
      title string,
      file string,
      PRIMARY KEY(id)
      );
      SQL
  end

  def build_meme(data)
    Memeblr::Meme.new(data)
  end

  def create_meme(data)
    @db.execute <<-SQL
    INSERT INTO memes (id, title, file)
    VALUES ("#{data[:title]}", "#{data[:file]}")
    SQL
  end
end
