require_relative 'user'

class Apostador < User
  attr_reader :apostas
  attr_accessor :balance

  def initialize(email, password, name, balance)
    super(email, password, name)
    @balance = balance
    @apostas = []
  end

  def addAposta(aposta)
    @apostas.push(aposta)
  end

  def notify(evento, valor)
    if valor > 0
      puts "#{name} acabou de ganhar #{valor} créditos no evento #{evento}!"
    else
      puts "O evento #{evento} acabou"
    end
    @balance += valor
  end

  def to_s
    if apostas.size > 0
      apostas = "\n\t"
      apostas += @apostas.to_a.join("\n\t")
    end
    "email:#{@email} name:#{@name} balance:#{@balance} apostas:#{apostas}"
  end
end
