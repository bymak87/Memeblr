module MEMEBLR
  class AddMeme < Command

    def run(url)
      meme = MEMEBLR.db.create_meme(url)

      # memes = MEMEBLR.db.get_meme(url: meme_data[:url])
      # return {:success => false, :error => "meme already exists"} if meme[:url]

      return {:success? => false, :error => "Meme could not stored"} if meme.nil?
      {:success? => true, :meme => meme}
    end
  end
end
