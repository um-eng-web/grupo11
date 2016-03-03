class User
  attr_reader :email
  attr_accessor :password, :name

  def initialize(email, password, name)
    @email = email
    @password = password
    @name = name
  end

  def to_s
    "email:#{@email} name:#{@name} password:#{@password}"
  end
end
