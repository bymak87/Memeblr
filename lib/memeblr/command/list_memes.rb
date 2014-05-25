class MEMEBLR::ListMemes
  def run
    memes = MEMEBLR.db.get_all_memes
  return {success?: false, error: "Error listing memes."} if memes.nil?
    {
      success?: true,
      memes: memes
    }
  end
end
