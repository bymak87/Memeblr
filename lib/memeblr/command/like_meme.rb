class MEMEBLR::LikeMeme
  def run(meme_data)
    meme = MEMEBLR.db.like_meme(meme_data[:like])
    return {success?: false, error: "meme does not exist"} if !meme
    return {success?: false, error: "incorrect password"} if meme.password != meme_data[:password]

    {
      success?: true,
      meme: meme
    }
  end
end
