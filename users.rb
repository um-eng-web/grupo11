require_relative 'user'

module Users
  @@users = {}

  def self.register(email, password, name)
    return nil if @@users[email]
    user = User.new(email, password, name)
    @@users[email] = user
  end

  def self.login(email, password)
    user = @@users[email]
    user if user && (user.password == password)
  end

  def self.get(email)
    user = @@users[email]
    user
  end

  def self.delete(email)
    user = @@users.delete(email)
  end

  def self.to_s
    @@users.to_s
  end
end
