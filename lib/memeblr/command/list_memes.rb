module MEMEBLR
  class ListMemes < Command

    def run(meme_data)

      memes = MEMEBLR.db.get_meme_by_name(meme_data[:url])

      return failure(:meme_does_not_exist) if memes.nil?


      success(:meme => meme)
    end
  end
end
