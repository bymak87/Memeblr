module MEMEBLR
  class AddMeme < Command

    def run(meme_data)
      memes = MEMEBLR.db.get_meme(url: meme_data[:url])
      return failure(:meme_already_exixts) if memes

      meme = MEMEBLR.db.create_meme(meme_data)
      return failure(:meme_not_stored) if meme.nil?

      success(:meme => meme)
    end
  end
end
