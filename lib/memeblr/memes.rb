module Memeblr

  class Meme

    attr_reader :id, :title, :file
    def initiailize(data)
      @id = data[:id]
      @title = data[:title]
      @file = data[:file]
    end

  end

end
