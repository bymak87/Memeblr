module MEMEBLR
  class ListMemes < Command

    def run(meme_data)

      memes = MEMEBLR.db.list_memes(meme_data[:id])

      return {:error => "meme does not exist"} if memes.nil?


      {:success => true, :meme => memes}
    end
  end
end
