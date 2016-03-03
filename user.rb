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
