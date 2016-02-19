class User
  attr_reader :email, :apostas
  attr_accessor :password, :name

  def initialize(email, password, name)
    @email = email
    @password = password
    @name = name
    @apostas = []
  end

  def addAposta(aposta)
    @apostas.push(aposta)
  end

  def to_s
    "email:#{@email} name:#{@name} apostas:#{@apostas}"
  end
end

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
