module MEMEBLR
  class LogInAdmin < Command
    # data = { username: 'Shehzan', password: "123"}
    def run(admin_data)
      # validate: admin exists?

      admin = MEMEBLR.db.get_admin_by_name(data[:username])
      return failure(:admin_name_does_not_exist) if admin.nil?

      if admin.password != data[:password] || admin.name != data[:username]
        return failure(:invalid_admin_or_password)
      end
      success(:admin => admin)
    end
  end
end
