module MEMEBLR
  class LogInAdmin < Command
    # data = { username: 'Shehzan', password: "123"}
    def run(admin_data)
      # validate: admin exists?

      admin = MEMEBLR.db.get_admin_by_name(data[:username])
      return failure(:success? => false, :error =>"Admin username does not exist") if admin.nil?

      if admin.password != data[:password] || admin.name != data[:username]
        return failure(:success? =>false, :error => "invalid admin or password")
      end
      success(:success? => true, :admin => admin, :message => "Successful login")
    end
  end
end
