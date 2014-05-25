class MEMEBLR::AddMeme
  def run(meme_data)
    meme = MEMEBLR.db.add_meme(meme_data[:url])
    return {success?: false, error: "meme does not exist"} if !meme
    return {success?: false, error: "incorrect password"} if meme.password != meme_data[:password]

    {
      success?: true,
      meme: meme
    }
  end
end
