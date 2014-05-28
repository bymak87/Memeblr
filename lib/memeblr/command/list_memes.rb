module MEMEBLR
  class ListMemes < Command

    def run
      memes = MEMEBLR.db.list_memes

      return {:error => "There are no memes."} if memes.nil?

      {:success => true, :meme => memes}
    end
  end
end
