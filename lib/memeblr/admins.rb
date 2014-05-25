class MEMEBLR::Admins

    attr_reader :id, :username, :password
    def initialize(id, username, password)
      @id = id
      @username = username
      @password = password
    end


end
