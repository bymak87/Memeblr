class MEMEBLR::Admins

    attr_reader :id, :username, :password
    def initialize(admin_data)
      @id = admin_data[:id]
      @username = admin_data[:username]
      @password = admin_data[:password]
    end


end
