module Memeblr

  class Admin

    attr_reader :id, :username, :password
    def initiailize(data)
      @id = data[:id]
      @username = data[:username]
      @password = data[:password]
    end

  end

end
