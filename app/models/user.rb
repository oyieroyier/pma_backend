class User < ActiveRecord::Base

    # retrieve password from hash
  def password
    @password ||= Password.new(passwordHash)
  end

  # create the password hash
  def password=(pass)
    @password = Password.create(pass)
    self.password_hash = @password
  end
end