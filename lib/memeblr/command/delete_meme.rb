class MEMEBLR::DeleteMeme
  def run(meme_data)
    meme = MEMEBLR.db.delete(meme_data[:id])
    return {success?: false, error: "username does not exist"} if !meme
    return {success?: false, error: "incorrect password"} if meme.password != meme_data[:password]

    {
      success?: true,
      meme: meme
    }
  end
end
