module MEMEBLR
  class GetMeme < Command
    def run(meme_data)
      meme = MEMEBLR.db.get_meme

      return {:success? => false, :error => "Meme not found"} if meme.nil?
      {:success? => true, :meme => meme}


    end
  end
end
