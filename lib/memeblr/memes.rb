class MEMEBLR::Memes

    attr_reader :id, :url

    def initialize(meme_data)
      @id = meme_data[:id]
      @url = meme_data[:url]
    end

end
