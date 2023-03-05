class User < ActiveRecord::Base
  has_many :links
  has_many :projects, through: :links

  # table consists of password_hash as a column to store password hashes in DB
  include BCrypt

  # retrieve password from hash
  def password
    @password ||= Password.new(passwordHash)
  end

  # create the password hash
  def password=(pw)
    @password = Password.create(pw)
    self.passwordHash = @password
  end
end
