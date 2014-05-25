class MEMEBLR::AdminLogin
  def run(admin_data)
    admin = MEMEBLR.db.get_admin_by_name(admin_data[:username])
    return {success?: false, error: "username does not exist"} if !admin
    return {success?: false, error: "incorrect password"} if admin.password != admin_data[:password]

    {
      success?: true,
      admin: admin
    }
  end
end
