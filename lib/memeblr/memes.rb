class MEMEBLR::Memes

    attr_reader :id, :url, :like


    def initialize(id, url, like=false)
      @id = id
      @url = url
      @like = like
    end

end
