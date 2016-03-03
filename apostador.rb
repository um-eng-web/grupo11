require_relative 'user'

class Apostador < User
  attr_reader :apostas, :balance

  def initialize(email, password, name, balance)
    super(email,password,name)
    @balance = balance
    @apostas = []
  end

  def addAposta(aposta)
    @apostas.push(aposta)
  end

  def to_s
    if apostas.size > 0
      apostas = "\n\t"
      apostas += @apostas.to_a.join("\n\t")
    end
    "email:#{@email} name:#{@name} balance:#{@balance} apostas:#{apostas}"
  end
end
