require_relative 'user'

class Apostador < User
  attr_reader :aposta, :balance

  def initialize(email, password, name, balance)
    super(email,password,name)
    @balance = balance
    @apostas = []
  end

  def addAposta(aposta)
    @apostas.push(aposta)
  end

  def to_s
    "email:#{@email} name:#{@name} balance:#{@balance} apostas:#{@apostas}"
  end
end
