module Memeblr

  class Meme

    attr_reader :id, :title, :file, :like
    def initiailize(data)
      @id = data[:id]
      @title = data[:title]
      @file = data[:file]
      @like = false
    end

  end

end
