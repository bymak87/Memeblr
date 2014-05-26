class MEMEBLR::DeleteMeme
  def run(meme_data)
    meme = MEMEBLR.db.delete(meme_data[:id])
    return {success?: false, error: "meme does not exist"} if !meme
    return {success?: false, error: "incorrect meme"} if meme.id != meme_data[:id]

    {
      success?: true,
      meme: meme
    }
  end
end
