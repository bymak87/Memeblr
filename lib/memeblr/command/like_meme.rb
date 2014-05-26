class MEMEBLR::LikeMeme
  def run(meme_data)
    meme = MEMEBLR.db.like_meme(meme_data[:like])
    return {success?: false, error: "meme not liked"} if meme.like != true

    {
      success?: true,
      meme: meme
    }



  end
end
